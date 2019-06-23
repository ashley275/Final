class Bottle{
  int x, y, w, h, col;
  int [] rows = {-1, -1, -1};
  int water = 0, damage;
  final int MAX_WATER = 100;
  
  int timeUnit = 10;
  int marchTimer = 0, attackTimer = 0;
  int idleTime, walkingTime, coolDownTime = 1;
  int walkingSpeed;
  boolean isAlive = false;
  
  int camp;
  int movement = 0;
  final int MARCH = 0, ATTACK = 1, STOP = 2;
  PImage marchImg, attackImg;
  
  Bottle(int camp, int col, int row){    
    this.camp = camp;
    this.col = col;
    rows[0] = row;
    x = 160 + col * LAND_SIZE;
    y = 220 + row * LAND_SIZE;
    walkingTime = 1;
    walkingSpeed = 8;
    water = MAX_WATER;
    isAlive = true;    
    lands[col][row].hasBottle = true;
  }
  
  void move(){
    for(int i = 0; i < rows.length; i++){
      if(water <= 0){
        isAlive = false;
        if(rows[i] != -1) lands[col][rows[i]].hasBottle = false;
      }else if(reconEnemy() == -2){      
        if(rows[i] != -1 && lands[col + camp][rows[i]].hasBottle){
          movement = STOP;
          break;
        }else movement = MARCH;
      }else movement = ATTACK;
    }
    
    switch(movement){
      case MARCH:
      march();
      break;       
      case ATTACK:
      attack();      
      break;      
      case STOP:
      marchTimer = (walkingTime + idleTime) * timeUnit;
      break;
    }
  }
  
  void march(){
    if(marchTimer == 0) marchTimer = (walkingTime + idleTime) * timeUnit;
    
    if(marchTimer > idleTime * timeUnit) x += walkingSpeed * camp;                
    marchTimer--;
    
    if(marchTimer == idleTime * timeUnit){
      col += camp;
      for(int i = 0; i < rows.length; i++){
        if(rows[i] != -1) capture(col, rows[i]);
      }
    }
  }
  
  void attack(){
    if(reconEnemy() == -2) return;
    if(reconEnemy() == -1){
      if(camp== RED){
        greenTowerHP-=damage;
        image(greenTowerHealthBarCover, width - 58, 260 , 38 , HEALTH_POINT-greenTowerHP);
        if(greenTowerHP <= 0){
           greenTowerHP = 0;
        }
      }else{
        redTowerHP-= damage;
        image(redTowerHealthBarCover,18, 260 , 38 ,HEALTH_POINT-redTowerHP);
        if(redTowerHP <= 0){
          redTowerHP = 0;
        }
      }
    }
    else{
      int i = (camp == RED) ? 1 : 0;
      if(bottles[i][reconEnemy()] == null 
      || !bottles[i][reconEnemy()].isAlive) return;
      
      bottles[i][reconEnemy()].water -= damage;     
    }
  }
  
  int reconEnemy(){
    if(onEdge()) return -1;
    
    int i = (camp == RED) ? 1 : 0;
    for(int j = 0; j < bottles[i].length; j++){
      if(bottles[i][j] == null || !bottles[i][j].isAlive) continue;
      
      for(int a = 0; a < rows.length; a++){
        for(int b = 0; b < rows.length; b++){
          if(rows[b]!=-1 && bottles[i][j].rows[a] == rows[b]){
              
            if(bottles[i][j].col == (col + camp)) return j;
            
            if(bottles[i][j].col == (col + camp * 2) 
            && bottles[i][j].x == x + (LAND_SIZE * camp)) return j;
          }
        }
      }
    }
    return -2;
  } 
  
  boolean onEdge(){
    return (camp == RED && col == 19) || (camp == GREEN && col == 0);
  }
  
  void capture(int col, int row){
    if(row != -1){
      if(lands[col][row].camp != 0 && lands[col][row].camp != camp){                    
        redLandNum = (camp == RED) ? redLandNum + 1 : redLandNum - 1;
        greenLandNum = (camp == GREEN) ? greenLandNum + 1 : greenLandNum - 1;
      }
     lands[col][row].camp = camp;
     lands[col][row].hasBottle = true;
     lands[col - camp][row].hasBottle = false;
    }
  }
    
  void display(){
    switch(movement){
      case ATTACK:
      image(attackImg,x,y);
      break;
      default:
      image(marchImg,x,y);
      break;
    }
  }  
}

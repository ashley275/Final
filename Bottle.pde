class Bottle{
  int x, y, w, h, col;
  int [] rows = new int [3];
  int water = 0, damage;
  final int MAX_WATER = 100;
  
  int timeUnit = 20;
  int marchTimer = 0, attackTimer = 0;
  int idleTime, walkingTime, coolDownTime = 1;
  int walkingSpeed;
  boolean isAlive = false;
  
  int camp;
  int movement = 0;
  final int MARCH = 0, ATTACK = 1;
  PImage img;
  
  Bottle(int camp, int col, int row){    
    this.camp = camp;
    this.col = col;
    rows[0] = row;
    x = 160 + col * LAND_SIZE;
    y = 220 + row * LAND_SIZE;
    w = LAND_SIZE;
    h = LAND_SIZE;
    walkingTime = 1;
    walkingSpeed = 4;
    water = MAX_WATER;
    isAlive = true;
  }
  
  void move(){   
    if(reconEnemy() == -2) movement = MARCH;
    else movement = ATTACK;
    
    switch(movement){
      case MARCH:
      march();
      break; 
      
      case ATTACK:
      attack();      
      break;
    }
    if(water <= 0) isAlive = false;
  }
  
  void march(){
    if(marchTimer == 0) marchTimer = (walkingTime + idleTime) * timeUnit;
    
    if(marchTimer > idleTime * timeUnit) x += walkingSpeed * camp;                
    marchTimer--;
    
    if(marchTimer == idleTime * timeUnit){
      col += camp;
      for(int i = 0; i < rows.length; i++){
        capture(col, rows[i]);
      }
    }
  }
  
  void attack(){
    if(reconEnemy() == -1){
      if(camp== RED)greenHP-=damage;
      else redHP-= damage;
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
    for(int j = 0; j < MAX_SOLDIER_NUM; j++){
      if(bottles[i][j] == null || !bottles[i][j].isAlive) continue;
      
      for(int a = 0; a < rows.length; a++){
        for(int b = 0; b < rows.length; b++){
          if(bottles[i][j].rows[a] == rows[b]){
              
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
    for(col = 0; col < COL_NUM; col++){
      for(row = 0; row < ROW_NUM; row++){
        if(lands[col][row].camp != 0 && lands[col][row].camp != camp){                    
          redLandNum = (camp == RED) ? redLandNum + 1 : redLandNum - 1;
          greenLandNum = (camp == GREEN) ? greenLandNum + 1 : greenLandNum - 1;
        }
        lands[col][row].camp = camp;
        //lands[col][row].img = (camp == RED) ? lands[col][row].redLand : lands[col][row].blueLand;
      }
    }
  }
    
  void display(){
    image(img, x, y);
  }  
}

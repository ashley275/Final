class Bottle{
  int x, y, col, row;
  int water = 0, damage = 1;
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
    this.row = row;
    x = 160 + col * LAND_SIZE;
    y = 220 + row * LAND_SIZE;
    walkingTime = 1;
    idleTime = 1;
    walkingSpeed = 4;
    water = MAX_WATER;
    isAlive = true;
    img = (camp == RED) ? redSoldier : blueSoldier;
  }
  
  void move(){
    switch(movement){
      case MARCH:
      if(reconEnemy() != -2){
        movement = ATTACK;
        break;
      }
      march();
      if(reconEnemy() != -2) movement = ATTACK;
      break; 
      
      case ATTACK:
      attack();
      if(water <= 0) isAlive = false;
      if(reconEnemy() == -2) movement = MARCH;;
      break;
    }
  }
  
  int reconEnemy(){
    if(onEdge()) return -1;
    
    int i = (camp == RED) ? 1 : 0;
    for(int j = 0; j < MAX_SOLDIER_NUM; j++){
      if(bottles[i][j] == null) continue;
      if(bottles[i][j].row == row){
          
        if(bottles[i][j].col == (col + camp)) return j;
        
        if(bottles[i][j].col == (col + camp * 2) 
        && bottles[i][j].x == x + (LAND_SIZE * camp)) return j;
      }
    }
    return -2;
  }  
  
  boolean onEdge(){
    return (camp == RED && col == 19) || (camp == BLUE && col == 0);
  }
  
  void march(){
                println(movement);
    println("."+x);
    println(".."+marchTimer);
    println("..."+reconEnemy());
    println("...."+col);
    if(marchTimer == 0) marchTimer = (walkingTime + idleTime) * timeUnit;
    
    if(marchTimer > idleTime * timeUnit) x += walkingSpeed * camp;                
    marchTimer--;
    
    if(marchTimer == idleTime * timeUnit) col += camp;
            println(movement);
    println("."+x);
    println(".."+marchTimer);
    println("..."+reconEnemy());
    println("...."+col); 
  }
  
  void attack(){
    if(reconEnemy() == -1);
    else{
      int i = (camp == RED) ? 1 : 0;
      if(bottles[i][reconEnemy()] == null 
      || !bottles[i][reconEnemy()].isAlive) return;
      
      bottles[i][reconEnemy()].water -= damage;     
    }
  }
    
  void display(){
    image(img, x, y);
  }  
}

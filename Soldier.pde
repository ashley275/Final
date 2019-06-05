class Soldier{
  int x, y, col, row;
  int health = 100, damage = 1;
  
  int timeUnit = 20;
  int marchTimer = 0, attackTimer = 0;
  int idleTime, walkingTime, coolDownTime = 1;
  int walkingSpeed;
  boolean isAlive = false;
  
  int camp;
  int movement = 0;
  final int MARCH = 0, ATTACK = 1;
  PImage img;
  
  Soldier(int camp, int col, int row){    
    this.camp = camp;
    this.col = col;
    this.row = row;
    x = 160 + col * LAND_SIZE;
    y = 220 + row * LAND_SIZE;
    walkingTime = 1;
    idleTime = 1;
    walkingSpeed = 4;
    isAlive = true;
    img = (camp == RED) ? redSoldier : blueSoldier;
  }
  
  void move(){
    switch(movement){
      case MARCH:
      march();
      break;
      case ATTACK:
      attack();
      if(health <= 0) isAlive = false;
      break;
    }
  }
  
  int reconEnemy(){
    if(onEdge()){
      movement = ATTACK;
      return -1;
    }
    
    int i = (camp == RED) ? 1 : 0;
    for(int j = 0; j < MAX_SOLDIER_NUM; j++){
      if(soldiers[i][j] == null) continue;
      if(soldiers[i][j].row == row && soldiers[i][j].camp != camp){
        if(soldiers[i][j].col == (col + camp)){
          movement = ATTACK;
          soldiers[i][j].movement = ATTACK;
          return j;
          //}else if(soldiers[i][j].col == (col + camp * 2)
          //&& movement == MARCH && soldiers[i][j].movement == MARCH
          //&& marchTimer == 0 && soldiers[i][j].marchTimer == 0){
          //  movement = ATTACK;
          //  return j;
        }
      }
    }    
    movement = MARCH;
    return -2;
  }  
  
  boolean onEdge(){
    return (camp == RED && col == 19) || (camp == BLUE && col == 0);
  }
  
  void march(){
    if(marchTimer == 0) marchTimer = (walkingTime + idleTime) * timeUnit;
    if(marchTimer > idleTime * timeUnit) x += walkingSpeed * camp;
    else if(marchTimer == idleTime * timeUnit){
      col += camp;println(reconEnemy());
      if(reconEnemy() != -2) return;
    }else if(marchTimer % timeUnit == 0){
      if(reconEnemy() != -2) return;
    }       
    marchTimer--;
  }
  
  void attack(){
    if(reconEnemy() == -1);
    else{
      int i = (camp == RED) ? 1 : 0;
      if(soldiers[i][reconEnemy()] == null 
      || !soldiers[i][reconEnemy()].isAlive) return;
      soldiers[i][reconEnemy()].health -= damage;
    }
  }
    
  void display(){
    image(img, x, y);
  }  
}

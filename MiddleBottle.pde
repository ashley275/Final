class MiddleBottle extends Bottle{
  MiddleBottle(int camp, int col, int row){
    super(camp, col, row);
    water = 100;
    damage = 2;
    idleTime = 2;
    marchImg = (camp == RED) ? loadImage("img/bottle/redBottleMiddle.png") : loadImage("img/bottle/greenBottleMiddle.png");
    attackImg = (camp == RED) ? loadImage("img/bottle/redBottleMiddleFighting.png") : loadImage("img/bottle/greenBottleMiddleFighting.png");
  }
  
  void display(){
    switch(movement){
      case MARCH:
      image(marchImg,x - LAND_SIZE,y- LAND_SIZE);
      break;
      case ATTACK:
      image(attackImg,x - LAND_SIZE,y- LAND_SIZE);
      break;
    }
  }
  
  void move(){
    super.move();
    int i = (camp == RED) ? 1 : 0;
    for(int j = 0; j < bottles[i].length; j++){
      if(bottles[i][j] != null) areaOfEffect(bottles[i][j]);
    }    
  }
  
  void areaOfEffect(Bottle bottle){
    if(x + LAND_SIZE * 2 > bottle.x && x - LAND_SIZE < bottle.x + LAND_SIZE){
      if(bottle.rows[0] == rows[0] - 1 || bottle.rows[2] == rows[0] - 1 ||
         bottle.rows[0] == rows[0] + 1 || bottle.rows[2] == rows[0] + 1 ){
        bottle.water -= damage;
      }
    }
  }
  

}

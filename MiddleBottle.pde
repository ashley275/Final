class MiddleBottle extends Bottle{
  MiddleBottle(int camp, int col, int row){
    super(camp, col, row);
    water = 100;
    damage = 1;
    idleTime = 2;
    marchImg = (camp == RED) ? loadImage("img/redSoldierMid") : loadImage("img/greenSoldierMid");
    attackImg = (camp == RED) ? loadImage("img/redSoldierMidFighting") : loadImage("img/greenSoldierMidFighting");
  }
  
  void display(){
    image(img, x - LAND_SIZE, y- LAND_SIZE);
  }
  
  void move(){
    super.move();
    int i = (camp == RED) ? 1 : 0;
    for(int j = 0; j < MAX_SOLDIER_NUM; j++){
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

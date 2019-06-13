class MiddleBottle extends Bottle{
  MiddleBottle(int camp, int col, int row){
    super(camp, col, row);
    water = 100;
    damage = 1;
    idleTime = 2;
  }
  
  void move(){
    int i = (camp == RED) ? 1 : 0;
    for(int j = 0; j < MAX_SOLDIER_NUM; j++){
      areaOfEffect(bottles[i][j]);
    }
    super.move();
  }
  
  void areaOfEffect(Bottle bottle){
    if(x + LAND_SIZE > bottle.x && x < bottle.x + LAND_SIZE
    && y + LAND_SIZE > bottle.y && y < bottle.y + LAND_SIZE){
      bottle.water -= damage;
    }
  }
}

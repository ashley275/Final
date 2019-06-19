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
    if((camp == RED && x + LAND_SIZE * 2 > bottle.x && x < bottle.x + LAND_SIZE)
    || (camp == GREEN && x + LAND_SIZE > bottle.x && x - LAND_SIZE < bottle.x + LAND_SIZE){
      if(bottle.row == row - 1 || bottle.row == row + 1){
        bottle.water -= damage;
      }
  }
}

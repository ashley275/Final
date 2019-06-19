class LargeBottle extends Bottle{ 
  LargeBottle(int camp, int col, int row){
    super(camp, col, row);
    water = 100;
    damage = 3;
    idleTime = 3;
    h = LAND_SIZE * 3;
    for(int i = 0; i < rows.length; i++){
      rows[i] = row + i;
    }
    marchImg = (camp == RED) ? loadImage("img/redSoldierHigh") : loadImage("img/greenSoldierHigh");
    attackImg = (camp == RED) ? loadImage("img/redSoldierHighFighting") : loadImage("img/greenSoldierHighFighting");
  }
  
  void display(){
    image(img, x, y);
  }
}

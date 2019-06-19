class SmallBottle extends Bottle{
  SmallBottle(int camp, int col, int row){
    super(camp, col, row);
    water = 100;
    damage = 2;
    idleTime = 1;
    marchImg = (camp == RED) ? loadImage("img/redSoldierNormal") : loadImage("img/greenSoldierNormal");
    attackImg = (camp == RED) ? loadImage("img/redSoldierNormalFighting") : loadImage("img/greenSoldierNormalFighting");
  }
  
  void display(){
    image(img, x, y);
  }
}

class SmallBottle extends Bottle{
  SmallBottle(int camp, int col, int row){
    super(camp, col, row);
    water = 100;
    damage = 2;
    idleTime = 1;
    marchImg = (camp == RED) ? loadImage("img/bottle/redBottleSmall.png") : loadImage("img/bottle/greenBottleSmall.png");
    attackImg = (camp == RED) ? loadImage("img/bottle/redBottleSmallFighting.png") : loadImage("img/bottle/greenBottleSmallFighting.png");
  }
}

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
    marchImg = (camp == RED) ? loadImage("img/bottle/redBottleLarge.png") : loadImage("img/bottle/greenBottleLarge.png");
    attackImg = (camp == RED) ? loadImage("img/bottle/redBottleLargeFighting.png") : loadImage("img/bottle/greenBottleLargeFighting.png");
  }
}

class SmallBottle extends Bottle{
  SmallBottle(int camp, int col, int row){
    super(camp, col, row);
    water = 100;
    damage = 2;
    idleTime = 1;
    marchImg = (camp == RED) ? loadImage("img/redSoldierNormal.png") : loadImage("img/greenSoldierNormal.png");
    attackImg = (camp == RED) ? loadImage("img/redSoldierFighting.png") : loadImage("img/greenSoldierFighting.png");
  }
  
  void display(){
    switch(movement){
      case MARCH:
      image(marchImg,x,y);
      break;
      case ATTACK:
      image(attackImg,x,y);
      break;
    }
  }
}

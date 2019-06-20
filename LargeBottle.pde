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
    marchImg = (camp == RED) ? loadImage("img/redSoldierHigh.png") : loadImage("img/greenSoldierHigh.png");
    attackImg = (camp == RED) ? loadImage("img/redSoldierHighFighting.png") : loadImage("img/greenSoldierHighFighting.png");
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

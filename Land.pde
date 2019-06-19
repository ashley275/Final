class Land{
  int col, row, camp;
  PImage img;
  
  Land(int col, int row, int camp){
    this.col = col;
    this.row = row;
    this.camp = camp;
    redLand = loadImage("img/redLand.png");
    blueLand = loadImage("img/blueLand.png");
    ownerlessLand = loadImage("img/ownerlessLand.png");
  }
  
  void cheeosUnlocked(){    
    if(redLandNum > 1);
    if(greenLandNum > 1);
  }
  
  void display(){
    switch(camp){
      case RED:
      img = redLand;
      break;
      case BLUE:
      img = blueLand;
      break;
      case OWNERLESS:
      img = ownerlessLand;
      break;
    }
    image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
  }

}

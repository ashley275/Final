class Land{
  int col, row, camp;
  boolean hasBottle = false;
  PImage img;
  
  Land(int col, int row, int camp){
    this.col = col;
    this.row = row;
    this.camp = camp;
    redLand = loadImage("img/redLand.png");
    greenLand = loadImage("img/greenLand.png");
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
      case GREEN:
      img = greenLand;
      break;
    }
    if(camp != 0) image((camp == RED) ? redLand : greenLand, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
  }

}

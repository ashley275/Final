class Land{
  int col, row, camp;
  boolean hasBottle = false;
  boolean hasItem = false;
  PImage img;
  
  Land(int col, int row, int camp){
    this.col = col;
    this.row = row;
    this.camp = camp;
    
    switch(camp){
      case RED:
      case OWNERLESS:
      img = loadImage("img/land/redLand.png");
      break;      
      default: img = loadImage("img/land/greenLand.png");break;
    }
  }
  
  void cheeosUnlocked(){    
    if(redLandNum > 1);
    if(greenLandNum > 1);
  }
  
  void display(){
    image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
  }
}

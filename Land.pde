class Land{
  int col, row, camp;
  boolean hasBottle = false;
  boolean hasItem = false;
  PImage redLand, greenLand;
  
  Land(int col, int row, int camp){
    this.col = col;
    this.row = row;
    this.camp = camp;

    redLand = loadImage("img/land/redLand.png");      
    greenLand = loadImage("img/land/greenLand.png");
  }
  
  void cheeosUnlocked(){    
    if(redLandNum > 1);
    if(greenLandNum > 1);
  }
  
  void display(){
    if(camp == RED) image(redLand, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
    else image(greenLand, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
    //if(hasBottle) text(8, 200 + col * LAND_SIZE, 240 + row * LAND_SIZE);
  }
}

class Land{
  int col, row, camp;
  boolean hasBottle = false;
  boolean hasItem = false;
  PImage img;
  
  Land(int col, int row, int camp){
    this.col = col;
    this.row = row;
    this.camp = camp;
    img = (camp == RED) ? loadImage("img/land/redLand.png") : loadImage("img/land/greenLand.png");
  }
  
  void cheeosUnlocked(){    
    if(redLandNum > 1);
    if(greenLandNum > 1);
  }
  
  void display(){
    image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
  }
}

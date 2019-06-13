class Land{
  int col, row;
  final int OWNERLESS = 0;
  int camp = 0;
  PImage redLand, blueLand, ownerlessLand;
  PImage img = ownerlessLand;
  
  Land(int col, int row){
    this.col = col;
    this.row = row;
    camp = OWNERLESS;
  }
  
  void cheeosUnlocked(){
    if(camp == RED) redLandNum++;
    if(camp == BLUE) blueLandNum++;
    
    if(redLandNum > 1);
    if(blueLandNum > 1);
  }
  
  void display(){
    image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
  }

}

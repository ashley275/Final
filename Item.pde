class Item {
  int col, row;
  boolean isAlive = false;
  PImage img;  

  void display(){
    image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
    //if(isAlive) text(3, 160 + col * LAND_SIZE, 280 + row * LAND_SIZE);
  }
  
  void use(){
  }
  
  void die(){
    isAlive = false;
    lands[col][row].hasItem = false;
  }

  Item(int col, int row){
    isAlive = true;
    this.col = col;
    this.row = row;
    lands[col][row].hasItem = true;
  }
}

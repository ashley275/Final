class Ball{
  int col, row;
  int itemType;
  boolean isAlive = false;
  PImage img;
  
  Ball(int item, int col, int row){
    this.col = col;
    this.row = row;
    itemType = item;
    isAlive = true;
    lands[col][row].hasItem = true;
    
    switch(itemType){
      case BLOOD:  img = loadImage("img/item/bloodball.png");break;
      case BANANA: img = loadImage("img/item/bananaball.png");break;
      case DOOR:   img = loadImage("img/item/doorball.png");break;
      case BOMB:   img = loadImage("img/item/bombball.png");break;
      case ICE:    img = loadImage("img/item/iceball.png");break;
      case TRAP:   img = loadImage("img/item/trapball.png");break;
    }
  }
  
  void display(){
    image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
  }
   
  void checkCollision(){
    if(lands[col][row].hasBottle){
      if(lands[col][row].camp == RED) redItemBar.number[itemType]++;
      else greenItemBar.number[itemType]++;
    }
  } 
}

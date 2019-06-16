class Item {
  boolean isAlive;
  float x, y;
  float w = LAND_SIZE;
  float h = LAND_SIZE;
  PImage img;
  

  void display(){
    if(isAlive==true){
        for(int i = 0; i < items.length; i++){
      image(img, x, y);
      }
    }
  }
  
  void pickup(){
  x=5000;
  isAlive = false;
  }
  
  void use(){
  isAlive = true;
  image(img,x,y);
  
  }
  
  void checkCollision(Bottle bottle){}

  Item(float x, float y){
    isAlive = true;
    this.x = x;
    this.y = y;
  }
}

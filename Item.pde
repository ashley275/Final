class Item {
  boolean isAlive;
  float x, y;
  float w = LAND_SIZE;
  float h = LAND_SIZE;
  PImage imgPick, imgUse;

  int itemState =0;
  int itemKind;
  

  void display(){
    itemState = ITEM_PICK_STATE;
    if(isAlive==true){
      if(itemState == ITEM_PICK_STATE){
        image(imgPick, x, y);
      }
      if(itemState == ITEM_USE_STATE ){
        image(imgUse, x, y);
      }
    }
  }
  
  
  /*void putDown(float x, float y){
    isAlive = true;
    x =  
    y = 
  
  }*/
   
  int checkCollision(Bottle bottle){
    if(isHit(x, y, LAND_SIZE, LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true&&itemState == ITEM_PICK_STATE){  
        isAlive=false;
        itemState = ITEM_USE_STATE;
        return 1;
        
    }else return 0;
     
  }

  Item(float x, float y){
    isAlive = true;
    this.x = x;
    this.y = y;
  }
}

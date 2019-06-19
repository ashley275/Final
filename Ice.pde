class Ice extends Item{
  
  Ice(float x, float y){
    super(x,y); 
    imgPick=iceball;
    imgUse=ice;
  }

  void display(){
    if(isAlive==true){
      if(itemState == ITEM_PICK_STATE){
        image(imgPick, x, y);
      }
      if(itemState == ITEM_USE_STATE ){
        image(imgUse, x, y);
      }
    }
  }
  
  int checkCollision(Bottle bottle){
    if(isHit(x, y, LAND_SIZE, LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true){  
        isAlive=false;
        return 1;       
    }else return 0 ;     
  }
}

class Door extends Item{
  
  Door(float x, float y){
    super(x,y); 
    imgPick=doorball;
    imgUse=door;
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
    if(bottle!=null&&isHit(x, y, LAND_SIZE, LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true){  
        isAlive=false;
        return 1;       
    }else return 0 ;     
  }
  
  void collision(Bottle bottle){
    if(bottle!=null){
    
    bottle.y += LAND_SIZE ;
    for(int i = 0; i<bottle.rows.length; i++){
    bottle.rows[i] ++ ;
  }
  }
  }
}

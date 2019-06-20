class Banana extends Item{
  
  Banana(float x, float y){
    super(x,y);
    imgPick=bananaball;
    imgUse=banana;
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
  int moveTimer = 40;
    moveTimer--;
    if(bottle!=null){if(moveTimer>0){
      if(bottle.camp == RED){
        bottle.x-=3*LAND_SIZE/40 ;
      }
      if(bottle.camp == GREEN){
        bottle.x+=3*LAND_SIZE/40 ;
      }
      }
    }
  }
  
}

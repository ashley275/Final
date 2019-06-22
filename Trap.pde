class Trap extends Item{
  
  Trap(float x, float y){
    super(x,y); 
    imgPick=trapball;
    imgUse=trap;
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
        //itemState = ITEM_USE_STATE;
        return 1;       
    }else return 0 ;     
  }
  
  void collision(Bottle bottle){
    if(bottle!=null){
    bottle.isAlive = false;}
  }
}
/*for(int j=0 ; j<MAX_SOLDIER_NUM ; j++){
                  if(items[k].checkCollision(bottles[1][j])==1 && bottles[1][j]!= null){
                    items[k].collision(bottles[1][j]);
                  }*/

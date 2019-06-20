class Bomb extends Item{ 
  
  Bomb(float x, float y){
    super(x,y);
    imgPick = bombball;
    imgUse = bomb;
    
  }
  void display(){
    /*int showTimer;*/
    if(isAlive==true){
      if(itemState == ITEM_PICK_STATE){
        image(imgPick, x, y);
      }
      if(itemState == ITEM_USE_STATE ){
        image(imgUse, x-LAND_SIZE, y-LAND_SIZE);
        /*showTimer = 40;
        showTimer--;
        if(showTimer<0) isAlive = false ;*/
      }
    }
  }

  int checkCollision(Bottle bottle){
    if(itemState == ITEM_PICK_STATE ){
      if(bottle!=null&&isHit(x, y, LAND_SIZE, LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true){  
        isAlive=false;
        itemState = ITEM_USE_STATE;
        return 1;
      }else return 0 ;
    }
    if(itemState == ITEM_USE_STATE){
      if(bottle!=null&&isHit(x-LAND_SIZE, y-LAND_SIZE, 3*LAND_SIZE, 3*LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true){  
        isAlive=false;
        return 1;
      }else return 0 ;
    
    }
     else return 0 ;
   }
   void collision(Bottle bottle){ 
       
        bottle.water-=10;
        
        
    }
  }

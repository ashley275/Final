class Canon extends Item{
  
  Canon(float x, float y){
    super(x,y);
    img=canon; 
  }
  
  
/*  void checkCollision(Bottle bottle){
    if(water < MAX_WATER
      && isHit(x, y, LAND_SIZE, LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true){
        water+=10;
        isAlive=false;
      }
  }
} /*

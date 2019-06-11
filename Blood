class Blood extends Item{
  
  Blood(float x, float y){
    super(x,y);
    img=blood; 
  }
  
  
  void checkCollision(Bottle bottle){
    if(water < MAX_WATER
      && isHit(x, y, LAND_SIZE, LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true){

        bottle.water+=10;
        isAlive=false;
      }
  }
}

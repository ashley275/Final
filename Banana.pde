class Banana extends Item{
  
  Banana(float x, float y){
    super(x,y);
    img=banana;
  }
  
  
  void checkCollision(Bottle bottle){
    if(water < MAX_WATER
      && isHit(x, y, LAND_SIZE, LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true){

        bottle.x -= (LAND_SIZE *3) /timeUnit;
        isAlive=false;
        col-=3;
      }
  }
}

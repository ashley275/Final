class Trap extends Item{
  
  Trap(float x, float y){
    super(x,y);
    img=trap;
  }
  
  
  void checkCollision(Bottle bottle){
    int count=3;
    if(water < MAX_WATER
      && isHit(x, y, LAND_SIZE, LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true && count>0){

        bottle.water=0;
        count--;
      }
      if(count<0){
        isAlive=false;
      }
  }

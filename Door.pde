class Door extends Item{
  
  Door(float x, float y){
    super(x,y); 
    img=door;
  }
  
  
  void checkCollision(Bottle bottle){
    if(water < MAX_WATER
      && isHit(x, y, LAND_SIZE, LAND_SIZE, bottle.x, bottle.y, bottle.w, bottle.h)&&isAlive==true){

        bottle.y += LAND_SIZE /timeUnit;
        isAlive=false;
        row++;
      }
  }
}

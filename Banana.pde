class Banana extends Item{
  
  Banana(int col, int row){
    super(col,row);
    img = banana;
  }
  
//  void display(){
//    int showTimer;
//    if(isAlive==true){
//      if(itemState == ITEM_PICK_STATE){
//        image(imgPick, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
//      }
//      //if(itemState == ITEM_USE_STATE ){
//      //  image(imgUse, x-LAND_SIZE, y-LAND_SIZE);
//      //  showTimer = 40;
//      //  showTimer--;
//      //  if(showTimer<0) isAlive = false ;
//      //}
//    }
//  }
  
//  void checkCollision(){
//    super.checkCollision();
//    if(camp == RED) redItemBar.barNumber[TRAP]++;
//    else if(camp == green) greenItemBar.barNumber[TRAP]++;
//  }
  
//  void collision(Bottle bottle){
//    int moveTimer = 40;
//    moveTimer--;
//    if(bottle!=null){if(moveTimer>0){
//      if(bottle.camp == RED){
//        bottle.x-=3*LAND_SIZE/40 ;
//      }
//      if(bottle.camp == GREEN){
//        bottle.x+=3*LAND_SIZE/40 ;
//      }
//    }
//  }
//}
}

class Door extends Item{
  
  Door(int col, int row){
    super(col,row); 
    img=door;
  }
  
//  void display(){
//    if(isAlive==true){
//      if(itemState == ITEM_PICK_STATE){
//        image(imgPick, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
//      }
//      //if(itemState == ITEM_USE_STATE ){
//      //  image(imgUse, x, y);
//      //}
//    }
//  }
  
//  void checkCollision(){
//    super.checkCollision();
//    if(camp == RED) redItemBar.barNumber[TRAP]++;
//    else if(camp == green) greenItemBar.barNumber[TRAP]++;
//  }
  
//  //void collision(Bottle bottle){
//  //  if(bottle!=null){
    
//  //  bottle.y += LAND_SIZE ;
//  //  for(int i = 0; i<bottle.rows.length; i++){
//  //  bottle.rows[i] ++ ;
//  //}
//  //}
//  //}
}

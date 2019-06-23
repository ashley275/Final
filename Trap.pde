class Trap extends Item{
  
  Trap(int col, int row){
    super(col,row); 
    imgPick=trapball;
    imgUse=trap;
  }
  
  void checkCollision(){
    super.checkCollision();
    if(camp == RED) redItemBar.barNumber[TRAP]++;
    else if(camp == green) greenItemBar.barNumber[TRAP]++;
  }
  
  void use(){
    if(bottle!=null){
    bottle.isAlive = false;}
  }
}
/*for(int j=0 ; j<MAX_SOLDIER_NUM ; j++){
                  if(items[k].checkCollision(bottles[1][j])==1 && bottles[1][j]!= null){
                    items[k].collision(bottles[1][j]);*/
                  }

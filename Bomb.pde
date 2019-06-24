class Bomb extends Item{ 
  
  Bomb(int col, int row){
    super(col,row);
    img = bomb;    
  }
  
  void display(){
    boolean isAliveImg = true;
    if(isAliveImg) image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
    int showTimer=40;
    showTimer--;
    if(showTimer<0) isAliveImg = false ;
  }
  
  void use(){
    for(int i=0; i<2; i++){
      for(int j=0; j<bottles[i].length; j++){
        if(bottles[i][j] == null || !bottles[i][j].isAlive) continue;

        for(int a = 0; a < bottles[i][j].rows.length; a++){
          if(bottles[i][j].rows[a]!=-1 && row+2 > bottles[i][j].rows[a] && row-2 < bottles[i][j].rows[a]){
            if(col+2 > bottles[i][j].col && col-2 < bottles[i][j].col){
              bottles[i][j].isAlive = false;
              isAlive = false;
            }
          }
        }
      }
    }
  }
}

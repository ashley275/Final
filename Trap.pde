class Trap extends Item{
  
  Trap(int col, int row){
    super(col,row); 
    img = trap;
  }
  
  void display(){
    boolean isALiveImg = true;
    if (isALiveImg){
      image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
      if(!isAlive)isALiveImg = false;
    }
  }

  void use(){
    for(int i=0; i<2; i++){
      for(int j=0; j<bottles[i].length; j++){
        if(bottles[i][j] == null || !bottles[i][j].isAlive) continue;

        for(int a = 0; a < bottles[i][j].rows.length; a++){
          if(bottles[i][j].rows[a]!=-1 && row == bottles[i][j].rows[a]){
            if(col == bottles[i][j].col){
              bottles[i][j].isAlive = false;
              isAlive = false;
            }
          }
        }
      }
    }
  }
}

class Trap extends Item{
  
  Trap(int col, int row){
    super(col,row); 
    img=trap;
  }
  
  void display(){
    image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
  }
  
  void use(){  
    for(int i=0; i<2; i++){
      for(int j=0; j<bottles[i].length; j++){
        if(bottles[i][j] == null || !bottles[i][j].isAlive) continue;
          //
        for(int c=0; c<bottles[i][j].rows.length; c++){
           if(bottles[i][j].rows[c]!=-1 && bottles[i][j].col==col && bottles[i][j].rows[c]==row){
            isAlive = false;
            bottles[i][j].isAlive = false;
          }
        }
      }
    }
  }
}

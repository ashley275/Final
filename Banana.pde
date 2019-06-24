class Banana extends Item{
  
  Banana(int col, int row){
    super(col,row);
    img = banana;
  }
  
  void display(){
    image(img, 160 + col * LAND_SIZE, 220 + row * LAND_SIZE);
  }

 
  void use(){      
   for(int i=0; i<2; i++){
     for(int j=0; j<bottles[i].length; j++){
       if(bottles[i][j] == null || !bottles[i][j].isAlive) continue;
       //banana die
       for(int c=0; c<bottles[i][j].rows.length; c++){
         if(bottles[i][j].rows[c]!=-1 && bottles[i][j].col==col && bottles[i][j].rows[c]==row){
           isAlive = false;
         }
       //other soldier die   
       for(int a=0; a<2; a++){
         for(int b=0; b<bottles[i].length; b++){
           for(int d=0; d<3; d++){
             if(i == 0){
               if(bottles[a][b].col == bottles[i][j].col-3 && bottles[a][b].rows[d]!=-1 && bottles[a][b].rows[d] == bottles[i][j].rows[c]) bottles[a][b].isAlive = false;
             }
             if(i == 1){
               if(bottles[a][b].col == bottles[i][j].col+3 && bottles[a][b].rows[d]!=-1 && bottles[a][b].rows[d] == bottles[i][j].rows[c]) bottles[a][b].isAlive = false;
             }
           }
         }
       }
     }
       //soldier move            
       if(i == 0) bottles[i][j].x-=3*LAND_SIZE;
       if(i == 1) bottles[i][j].x+=3*LAND_SIZE;
     }
   }
 }
}

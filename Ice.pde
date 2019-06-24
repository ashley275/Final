class Ice extends Item{
  int camp;
  int iceTimer = 80;
  
  Ice(int camp, int col, int row){
    super(col, row); 
    img = ice;
    this.camp = camp;
  }

  void use(){
    //int i = (camp == RED) ? 1 : 0;
    //for(int j = 0; j < bottles[i].length; j++){
    //  int lastMovement = bottles[i][j].movement;
    //  if(iceTimer > 0 ){
    //    bottles[i][j].movement = bottles[i][j].STOP;
    //    iceTimer--;
    //  }else{
    //    bottles[i][j].movement = lastMovement;
    //    isAlive = false;
    //  }
    //}
    for(int j = 0; j < bottles[1].length; j++){
      if(bottles[1][j] != null){
        bottles[1][j].update = false;
        bottles[1][j].movement = bottles[1][j].STOP;
      }
    }
  }
}

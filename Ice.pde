class Ice extends Item{
  int camp;
  int iceTimer = 80;
  
  Ice(int camp, int col, int row){
    super(col, row); 
    img = ice;
    this.camp = camp;
  }

  void use(){
    int i = (camp == RED) ? 1 : 0;
    for(int j = 0; j < bottles[i].length; j++){
      if(bottles[i][j] != null){
        if(iceTimer > 0 ){
          bottles[i][j].update = false;
          bottles[i][j].movement = bottles[i][j].STOP;
          iceTimer--;//println(iceTimer);
        }else{
          bottles[i][j].update = true;
          die();
        }
      }
    }
  }
}

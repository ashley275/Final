class Bar{
  float x, y, w;
  int spaceNum;
  final int SPACE_SIZE = 100;
  int [] barNumber =  {-1, -1, -1, -1, -1, -1};
  
  Bar(float x,float y, int num){
    this.x = x;
    this.y = y;
    spaceNum = num; 
    w = SPACE_SIZE * num;
  }
  
  void displayNumber(float x, float y){
    for(int i = 0; i < barNumber.length; i++){
      if(barNumber[i] != -1){
        fill(0, 0, 0);
        textSize(32);
        text(barNumber[i], x + i * w / spaceNum, y);
      }
    }   
  }
}

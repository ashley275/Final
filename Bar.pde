class Bar{
  float x, y;
  int spaceNum;
  final int SPACE_SIZE = 100;
  final int TEXT_SIZE = 80;
  
  float w = SPACE_SIZE * spaceNum;  
  int [] barNumber =  {-1, -1, -1, -1, -1, -1};
  
  Bar(int num){      
    spaceNum = num;
    y = 900;
    for(int i = 0; i < num; i++){
      barNumber[i] = 0;
    }
  }
  
  void textNumber(float x){
    for(int i = 0; i < barNumber.length; i++){
      if(barNumber[i] != -1){
        fill(0, 0, 0);
        textSize(32);
        text(barNumber[i], x + TEXT_SIZE + i * SPACE_SIZE, y + TEXT_SIZE);
      }
    }   
  }
}

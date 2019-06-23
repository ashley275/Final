class Bar{
  int x, y;
  int spaceNum;
  final int SPACE_SIZE = 100;
  final int TEXT_SIZE = 80;
  
  int w = SPACE_SIZE * spaceNum;  
  int [] number =  {-1, -1, -1, -1, -1, -1};
  PImage img;
  
  Bar(int num, PImage img){
    this.img = img;
    spaceNum = num;
    y = 900;
    for(int i = 0; i < num; i++){
      number[i] = 0;
    }
  }
  
  void display(float x){
    image(img, x, y);
  }
  
  void textNumber(){
    for(int i = 0; i < barNumber.length; i++){
      if(number[i] != -1){
        fill(0, 0, 0);
        textSize(32);
        text(number[i], x + TEXT_SIZE + i * SPACE_SIZE, y + TEXT_SIZE);
      }
    }   
  }
}

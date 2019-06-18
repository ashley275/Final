class ItemBar{
  float x, y;
  int canonNumber,trapNumber,bananaNumber,doorNumber,iceNumber,bloodNumber;
  
  ItemBar(float x,float y){
    this.x = x;
    this.y = y;
  }
  
 void displayItemNumber(float x){
    fill(0, 0, 0);
    textSize(32);
    text(canonNumber, x, 980);
    text(trapNumber, x+100, 980);
    text(bananaNumber, x+200, 980);
    text(doorNumber, x+300, 980);
    text(iceNumber, x+400, 980);
    text(bloodNumber, x+500, 980);
   
  }

}

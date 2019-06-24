class RoundPic{

boolean isAlive = false;
float picX, picY;   

RoundPic(){

  picX = -960;
  picY = 0;
  round1 = loadImage("img/page/round1.png");
  round2 = loadImage("img/page/round2.png");
  round3 = loadImage("img/page/round3.png");
}

void display(){
  if(isAlive){
    if(round == 0 ) image(round1,picX,picY);
    else if(round == 1 ) image(round2,picX,picY);
    else if(round == 2 ) image(round3,picX,picY);
  }
  int showTimer = 400;
  showTimer--;
  if(showTimer<=0)isAlive = false;
  picX+=500;
  } 
}

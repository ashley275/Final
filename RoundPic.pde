class RoundPic{

boolean isAlive = false;
int picX, picY; 
int showTimer = 20;

RoundPic(){
  isAlive = true;
  picX = -1920;
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
  
  showTimer--;
  if(showTimer <= 0) isAlive = false;
  picX += (1920 * 2 / 20);
  } 
}

PImage bg, gamestart, gameover;
PImage startNormal, startHovered, restartNormal, restartHovered;
PImage banana, ice, blood, bomb, door, trap;
PImage props3, props6;
PImage redSoldier, blueSoldier;
PImage redLand, blueLand, ownerlessLand;
PImage redChoose, greenChoose, redChooseProp, greenChooseProp;
PImage bananaball;

final int GAME_START = 0, GAME_SET = 1, GAME_FIGHT = 2, GAME_OVER = 3;
int gameState = 2;
int round = 0;
int gameTimer = 3600;

final int LAND_SIZE = 80;
final int COL_NUM = 20, ROW_NUM = 8;
int redLandNum = 0, greenLandNum = 0;
int RedRectCol = 0, RedRectRow = 0;
int GreenRectCol = 0, GreenRectRow = 0;


int HEALTH_POINT = 500;
int redHP = HEALTH_POINT;
int greenHP = HEALTH_POINT;

int chooseX = 160, chooseY = 220;
boolean moveRectAlive = false;

/*
final int START_BUTTON_WIDTH = 144;
final int START_BUTTON_HEIGHT = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
*/

int soldierLevel = 0;
final int SOLDIER_LOW = 1, SOLDIER_MID = 2, SOLDIER_HIGH = 3;
final int RED = 1, BLUE = -1, OWNERLESS = 0;

final int ROUND_ONE_LOW_SOLDIER_NUM = 1;
final int ROUND_TWO_LOW_SOLDIER_NUM = 1;
final int ROUND_THREE_LOW_SOLDIER_NUM = 1;
final int ROUND_ONE_MID_SOLDIER_NUM = 1;
final int ROUND_TWO_MID_SOLDIER_NUM = 1;
final int ROUND_THREE_MID_SOLDIER_NUM = 1;
final int ROUND_ONE_HIGH_SOLDIER_NUM = 1;
final int ROUND_TWO_HIGH_SOLDIER_NUM = 1;
final int ROUND_THREE_HIGH_SOLDIER_NUM = 1;
final int MAX_SOLDIER_NUM = 9;

int redLowSoldierUsed = 0;
int blueLowSoldierUsed = 0;
int redLowSoldierAVL = 0;
int blueLowSoldierAVL = 0;
int redMidSoldierUsed = 0;
int blueMidSoldierUsed = 0;
int redMidSoldierAVL = 0;
int blueMidSoldierAVL = 0;
int redHighSoldierUsed = 0;
int blueHighSoldierUsed = 0;
int redHighSoldierAVL = 0;
int blueHighSoldierAVL = 0;

Land lands [][];
Bottle bottles [][];
Item items [];
ItemBar redItemBar;
ItemBar greenItemBar;

boolean move = false;

void setup() {
  size(1920,1080);
  frameRate(40);
  /*bg = loadImage("img/bg.jpg");
  gamestart = loadImage("img/gamestart.png");
  gameover = loadImage("img/gaemover.png");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  */
  redChoose = loadImage("img/redChoose.png");
  greenChoose = loadImage("img/greenChoose.png");
  redChooseProp = loadImage("img/redChooseProp.png");
  greenChooseProp = loadImage("img/greenChooseProp.png");
  redSoldier = loadImage("img/red_soldier.jpg");
  blueSoldier = loadImage("img/blue_soldier.jpg");
  

 
  
  //item = loadImage("img/item.jpg");
  banana = loadImage("img/banana1.png");
  door = loadImage("img/door.png");
  bomb = loadImage("img/bomb.png");
  props3 = loadImage("img/props3.png");
  props6 = loadImage("img/props6.png");
  
  bananaball = loadImage("img/bananaball.png");
  
  lands = new Land [COL_NUM][ROW_NUM];
  for(int col =0;col<COL_NUM;col++){
    for(int row = 0; row<ROW_NUM;row++){
      if(col ==0 || col==1){
        lands[col][row] = new Land(col, row, RED);
        redLandNum = ROW_NUM*2;
      }else if(col == 18 || col == 19){
        lands[col][row] = new Land(col, row, BLUE);
        greenLandNum = ROW_NUM*2;
      }else lands[col][row] = new Land(col, row, OWNERLESS);
    }
  }
  
  bottles = new Bottle[2][MAX_SOLDIER_NUM];
  redItemBar = new ItemBar(10,10);
  greenItemBar = new ItemBar(20,10);
  
  items = new Item[8];
  for(int i = 0; i <3; i++){
  float newX1 = LAND_SIZE * (2+ i * 4 + floor(random(2)));
  float newX2 = LAND_SIZE * (2+ i * 4 + floor(random(2,4)));
  float newY1= LAND_SIZE * floor(random(ROW_NUM));
  float newY2= LAND_SIZE * floor(random(ROW_NUM));
  
    switch(i){
       case 0: int showUp = floor(random(0,2));
          if(showUp == 0){ 
          items[0] = new Canon(newX1, newY1);
          items[0].itemKind = 1;
          items[1] = new Canon(newX2, newY2);
          items[1].itemKind = 1;
        }
        if(showUp == 1){ 
          items[0] = new Trap(newX1, newY1);
          items[0].itemKind = 2;
          items[1] = new Trap(newX2, newY2);
          items[1].itemKind = 2;
        }
    
    case 1:showUp = floor(random(0,10));
          if(showUp == 0){ 
          items[2] = new Banana(newX1, newY1);
          items[2].itemKind = 3;
          items[3] = new Banana(newX2, newY2);
          items[3].itemKind = 3;
        }else{ 
          items[2] = new Door(newX1, newY1);
          items[2].itemKind = 4;
          items[3] = new Door(newX2, newY2);
          items[3].itemKind = 4;
        }
    
    case 2: showUp = floor(random(0,10));
          if(showUp == 0){ 
          items[4] = new Ice(newX1, newY1); 
          items[4].itemKind = 5;
          items[5] = new Ice(newX2, newY2);
          items[5].itemKind = 5;
        }else{ 
          items[4] = new Blood(newX1, newY1);
          items[4].itemKind = 6;
          items[5] = new Blood(newX2, newY2);
          items[5].itemKind = 6;
        }
    
    case 3: showUp = floor(random(0,2));
          if(showUp == 0){ 
          items[6] = new Canon(newX1, newY1); 
          items[6].itemKind = 1;
          items[7] = new Canon(newX2, newY2);
          items[7].itemKind = 1;
        }
        if(showUp == 1){ 
          items[6] = new Trap(newX1, newY1);
          items[6].itemKind = 2;
          items[7] = new Trap(newX2, newY2);
          items[7].itemKind = 2;
        }
      }
  }
}


void initGame(){

}

void draw(){
  switch(gameState){
    
    case GAME_START:
    background(255);
    drawGameRound("GAME START",#88FFDB);
    rect(12,12,12,12);
    /*
      if(isMouseHit(START_BUTTON_X, START_BUTTON_Y, START_BUTTON_WIDTH, START_BUTTON_HEIGHT)) {
  
        image(startHovered, START_BUTTON_X, START_BUTTON_Y);
        if(mousePressed){
          gameState = GAME_SET;
          mousePressed = false;
        }
      }else{
        image(startNormal, START_BUTTON_X, START_BUTTON_Y);
      }
    */
      break;
      
    case GAME_SET:
      background(255);
      drawGameRound("GAME SET",#000055);
      
      //land
      strokeWeight(2);
      for(int i = 0; i < 21; i++){
        line(160 + i * 80, 220, 160 + i * 80, 860);
      }
      for(int i = 0; i < 9; i++){
        line(160, 220 + i * 80, 1760, 220 + i * 80);
      }
      
      for(int col = 0; col < COL_NUM; col++){
        for(int row = 0; row < ROW_NUM; row++){
          lands[col][row].display();
        }
      }
      
      //prop
      image(props3,630,900);
      image(props6,20,900);
      image(props3,width-630-300,900);
      image(props6,width-20-600,900);
      image(banana,30,910);
      image(door,130,910);
      image(bomb,230,910);
      
      redItemBar.displayItemNumber(90);
      greenItemBar.displayItemNumber(1380);
      moveRect();
      for(int i=0; i<items.length; i++){
        items[i].display();
      }
      //soldier
      for(int i = 0; i < 2; i++){
        for(int j = 0; j < MAX_SOLDIER_NUM; j++){
          if(bottles[i][j] != null && bottles[i][j].isAlive == true){
            bottles[i][j].display();
          }
        }
      } 
      timeCountdown();

      /*if (gameTimer ==0);
      gameState = GAME_FIGHT;*/
      
      break;
    
    case GAME_FIGHT:
      background(255);
      drawGameRound("GAME FIGHT",#000055);
      //land
      
      strokeWeight(2);
      for(int i = 0; i < 21; i++){
        line(160 + i * 80, 220, 160 + i * 80, 860);
      }
      for(int i = 0; i < 9; i++){
        line(160, 220 + i * 80, 1760, 220 + i * 80);
      }
      
      //soldier
      for(int i = 0; i < 2; i++){
        for(int j = 0; j < MAX_SOLDIER_NUM; j++){
          if(bottles[i][j] != null && bottles[i][j].isAlive == true){
            bottles[i][j].display();
            bottles[i][j].move();
          }
        }
      }
      
      //prop
      image(props3,630,900);
      image(props6,20,900);
      image(props3,width-630-300,900);
      image(props6,width-20-600,900);
      image(banana,30,910);
      image(door,130,910);
      image(bomb,230,910);     
      redItemBar.displayItemNumber(90);
      greenItemBar.displayItemNumber(1380);

      if (gameTimer ==0){
        round++;
        gameState = GAME_SET;
      }
      if ((gameTimer ==0 && round ==2)|| redHP==0 || greenHP ==0){
          gameState = GAME_OVER;
      }
    
      break;
      
    case GAME_OVER:
      background(255);
      drawGameRound("GAME OVER",#000055);
      
      if(redHP==0){}
      else if(greenHP==0){}
      else if(redLandNum>greenLandNum){}
      else if(redLandNum>greenLandNum){}
     // else {draw}
    /*
      if(isMouseHit(START_BUTTON_X, START_BUTTON_Y, START_BUTTON_WIDTH, START_BUTTON_HEIGHT)){
  
        image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
        if(mousePressed){
          gameState = GAME_SET;
          mousePressed = false;
          initGame();
        }
      }else{
        image(restartNormal, START_BUTTON_X, START_BUTTON_Y);
      }
    */
      break;
  }
}

boolean isMouseHit(float bx, float by, float bw, float bh){
  return  mouseX > bx && 
        mouseX < bx + bw && 
        mouseY > by && 
        mouseY < by + bh;
}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh){
  return  ax+ah > bx && 
        ax < bx + bw && 
        ay+ah > by && 
        ay < by + bh;
}

void moveRect(){
  image(redChoose, chooseX, chooseY);
  if(chooseX<=160)chooseX = 160;
  if(chooseX>=width-240)chooseX = width-240;
  if(chooseY<=220)chooseY = 220;
  if(chooseY>=height-300)chooseY = height-300;
  }
  
void drawGameRound(String text, color textColor){
  textSize(50);
  textAlign(CENTER);
  fill(0,120);
  text(text, 200, 200);
  fill(textColor);
  text(text, 200, 200);
}

void timeCountdown(){
   
  textAlign(LEFT, BOTTOM);
  String timeString = convertFrameToTimeString(gameTimer);
  fill(0, 120);
  text(timeString, 3, height + 3);
  fill(#00ffff);
  text(timeString, 0, height); 
  gameTimer --;
}

String convertFrameToTimeString(int frames){
  String result = "";
  float totalSeconds = float(frames) / 60;
  result += nf(floor(totalSeconds), 2);
  
  return result;
}

void keyPressed(){
  if(gameState == GAME_SET){
    if(key==CODED){
      switch(keyCode){
        case LEFT:
          if(chooseX>160)chooseX-=80;
          break;
        case RIGHT:
          if(chooseX<width-240)chooseX+=80;
          break;
        case DOWN:
          if(chooseY<height-300)chooseY+=80;
          break;
        case UP:
          if(chooseY>220)chooseY-=80;
          break;
      }
    }
    switch(key){
      case 'a':
        break;
      case 'd':
        break;
      case 's':
        break;
      case 'w':
        break;
      case 'r':
        bottles[0][redLowSoldierUsed] = new Bottle(RED, 0, redLowSoldierUsed);
        redLowSoldierUsed++;
        redLowSoldierAVL--;
        break;
      case 'b':
        bottles[1][blueLowSoldierUsed] = new Bottle(BLUE, 19, blueLowSoldierUsed);
        blueLowSoldierUsed++;
        blueLowSoldierAVL--;
        break;
      case 'm':
        move = true;
        break;
      case 'z'://start move
        moveRectAlive = true;
        break;
    }
  }
  if(gameState == GAME_FIGHT){
    if(key==CODED){
      switch(keyCode){
        case LEFT:
          if(chooseX>160)chooseX-=80;
          break;
        case RIGHT:
          if(chooseX<width-240)chooseX+=80;
          break;
        case DOWN:
          if(chooseY<height-300)chooseY+=80;
          break;
        case UP:
          if(chooseY>220)chooseY-=80;
          break;
      }
    }
    switch(key){
      case 'a':
        break;
      case 'd':
        break;
      case 's':
        break;
      case 'w':
        break;
      case 'z'://start move
        moveRectAlive = true;
        break;

    }
  }
  switch(key){//demo
    case 'g':
      gameState = GAME_START;
      break;
    case 'h':
      gameState = GAME_SET;
      break;
    case 'j':
      gameState = GAME_FIGHT;
      break;
    case 'k':
      gameState = GAME_OVER;
    break;
  }
}

void keyReleased(){

}

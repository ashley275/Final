// Music
import ddf.minim.*;
Minim minim;
AudioPlayer song;

// Image
// -page
PImage bg, gamestart, gameover, gameread, gameread2, gameread3;
PImage startNormal, startHovered, restartNormal, restartHovered, skipNormal, skipHovered ;
PImage round1, round2,round3;

// -scene
PImage itemBar, bottleBarLeft, bottleBarRight;
PImage redTower, greenTower;
PImage towerHealthBar, redTowerHealthBarCover, greenTowerHealthBarCover;
PImage bolbNormal, kappaNormal, bolbAward, kappaAward;

// -choose
PImage redChoose, greenChoose, redChooseProp, greenChooseProp;

// -item
PImage bananaball, iceball, bloodball, bombball, doorball, trapball;
PImage banana, banana1, banana2, banana3, ice, blood, bomb, door, trap;
PImage explosion;

// -bottle
PImage redBottleSmall, redBottleMiddle, redBottleLarge;
PImage redBottleSmallFighting, redBottleMiddleFighting, redBottleLargeFighting;
PImage greenBottleSmall, greenBottleMiddle, greenBottleLarge;
PImage greenBottleSmallFighting, greenBottleMiddleFighting, greenBottleLargeFighting;

// -land
PImage redLand, greenLand, ownerlessLand;

// Variable
// -button
final int START_BUTTON_WIDTH = 300;
final int START_BUTTON_HEIGHT = 100;
final int START_BUTTON_X = 800;
final int START_BUTTON_Y = 700;

final int RESTART_BUTTON_WIDTH = 450;
final int RESTART_BUTTON_HEIGHT = 130;
final int RESTART_BUTTON_X = 750;
final int RESTART_BUTTON_Y = 800;

final int SKIP_BUTTON_WIDTH = 300;
final int SKIP_BUTTON_HEIGHT = 100;
final int SKIP_BUTTON_X = 1600;
final int SKIP_BUTTON_Y = 900;

// -gamestate
int gameState = 0;
final int GAME_START = 0, GAME_INTRO=1, GAME_SET = 2, GAME_FIGHT = 3, GAME_OVER = 4;
int round = 0;

// -timer
int gameTimer = 0;
final int GAME_SET_TIME = 200, GAME_FIGHT_TIME = 400;

// -camp
final int RED = 1, GREEN = -1, OWNERLESS = 0;

// -hp
int HEALTH_POINT = 1000;
int redTowerHP = HEALTH_POINT;
int greenTowerHP = HEALTH_POINT;
float redTowerHPCover = 0, greenTowerHPCover = 0;

// -choose
boolean isChoosing = false;
int redChooseX = 160, redChooseY = 220;
int greenChooseX = 1680, greenChooseY = 220;
int redChooseCol = 0, redChooseRow = 0, greenChooseCol = 19, greenChooseRow = 0;

// -bar
final int BLOOD = 0, BANANA = 1, DOOR = 2, BOMB = 3, ICE = 4, TRAP = 5;
final int BOTTLE_SMALL = 0, BOTTLE_MIDDLE = 1, BOTTLE_LARGE = 2;

// -bottle
int redBottleUsed, greenBottleUsed;
int redSmallBottleAVL, redMiddleBottleAVL, redLargeBottleAVL;
int greenSmallBottleAVL, greenMiddleBottleAVL, greenLargeBottleAVL;
final int ROUND_ONE_SMALL_BOTTLE_NUM = 1;
final int ROUND_ONE_MIDDLE_BOTTLE_NUM = 1;
final int ROUND_ONE_LARGE_BOTTLE_NUM = 1;
final int ROUND_TWO_SMALL_BOTTLE_NUM = 1;
final int ROUND_TWO_MIDDLE_BOTTLE_NUM = 1;
final int ROUND_TWO_LARGE_BOTTLE_NUM = 1;
final int ROUND_THREE_SMALL_BOTTLE_NUM = 1;
final int ROUND_THREE_MIDDLE_BOTTLE_NUM = 1;
final int ROUND_THREE_LARGE_BOTTLE_NUM = 1;
final int MAX_BOTTLE_NUM = 10;

// -land
final int LAND_SIZE = 80;
final int COL_NUM = 20, ROW_NUM = 8;
int redLandNum = 0, greenLandNum = 0;

// Class
Land lands [][];
Bottle bottles [][];
Item items [][];
Ball balls[];
Bar redItemBar;
Bar greenItemBar;
Bar redBottleBar;
Bar greenBottleBar;

// Font
PFont font;

void setup() {
  // Set
  size(1920,1080);
  frameRate(40);
  
  // Music
  minim = new Minim(this);
  song = minim.loadFile("song.mp3", 1024);
  song.play();
  song.loop();
  
  // Image
  // -pages
  bg = loadImage("img/page/bg.png");
  gamestart = loadImage("img/page/gamestart.png");
  gameover = loadImage("img/page/gameover.png");
  gameread = loadImage("img/page/gameread.png");
  gameread2 = loadImage("img/page/gameread2.png");
  gameread3 = loadImage("img/page/gameread3.png");
  startNormal = loadImage("img/page/startNormal.png");
  startHovered = loadImage("img/page/startHovered.png");
  restartNormal = loadImage("img/page/restartNormal.png");
  restartHovered = loadImage("img/page/restartHovered.png");
  skipNormal = loadImage("img/page/skipNormal.png");
  skipHovered = loadImage("img/page/skipHovered.png");
  
  round1 = loadImage("img/page/round1.png");
  round2 = loadImage("img/page/round2.png");
  round3 = loadImage("img/page/round3.png");
  
  // -choose
  redChoose = loadImage("img/choose/redChoose.png");
  greenChoose = loadImage("img/choose/greenChoose.png");
  redChooseProp = loadImage("img/choose/redChooseProp.png");
  greenChooseProp = loadImage("img/choose/greenChooseProp.png");
  
  // -bar
  itemBar = loadImage("img/scene/itemBar.png");
  bottleBarLeft = loadImage("img/scene/redBottleBar.png");
  bottleBarRight = loadImage("img/scene/greenBottleBar.png");
  
  // -tower
  redTower = loadImage("img/scene/redTower.png"); 
  greenTower = loadImage("img/scene/greenTower.png");
  towerHealthBar = loadImage("img/scene/towerHealthBar.png");
  redTowerHealthBarCover = loadImage("img/scene/redTowerHealthBarCover.png");
  greenTowerHealthBarCover = loadImage("img/scene/greenTowerHealthBarCover.png");  
     
  // -name
  bolbNormal = loadImage("img/scene/bolbNormal.png"); 
  bolbAward = loadImage("img/scene/bolbAward.png"); 
  kappaNormal = loadImage("img/scene/kappaNormal.png"); 
  kappaAward = loadImage("img/scene/kappaAward.png");
  
  // -item
  banana = loadImage("img/item/banana.png");
  banana1 = loadImage("img/item/banana1.png");
  banana2 = loadImage("img/item/banana2.png");
  banana3 = loadImage("img/item/banana3.png");
  door = loadImage("img/item/door.png");
  bomb = loadImage("img/item/explosion.png");
  ice = loadImage("img/item/ice.png");
  blood = loadImage("img/item/blood.png");
  trap = loadImage("img/item/trap.png"); 
  
  // -bottle
  redBottleSmall = loadImage("img/bottle/redBottleSmall.png");
  redBottleMiddle = loadImage("img/bottle/redBottleMiddle.png");
  redBottleLarge = loadImage("img/bottle/redBottleLarge.png");  
  redBottleSmallFighting = loadImage("img/bottle/redBottleSmallFighting.png"); 
  redBottleMiddleFighting = loadImage("img/bottle/redBottleMiddleFighting.png");
  redBottleLargeFighting = loadImage("img/bottle/redBottleLargeFighting.png");  
  
  greenBottleSmall = loadImage("img/bottle/greenBottleSmall.png");  
  greenBottleMiddle = loadImage("img/bottle/greenBottleMiddle.png");  
  greenBottleLarge = loadImage("img/bottle/greenBottleLarge.png");
  greenBottleSmallFighting = loadImage("img/bottle/greenBottleSmallFighting.png");
  greenBottleMiddleFighting = loadImage("img/bottle/greenBottleMiddleFighting.png");
  greenBottleLargeFighting = loadImage("img/bottle/greenBottleLargeFighting.png"); 
  
  // Class
  items = new Item[6][8];  
  bottles = new Bottle[2][MAX_BOTTLE_NUM];
  lands = new Land[COL_NUM][ROW_NUM];  
  balls = new Ball[24];
  
  redItemBar = new Bar(6, itemBar);
  greenItemBar = new Bar(6, itemBar);
  redBottleBar = new Bar(3, bottleBarRight);
  greenBottleBar = new Bar(3, bottleBarLeft);

  // Font      
  font = createFont("font.ttf",100);
  
  initGame();  
}


void initGame(){
  // Image
  // -tower
  image(redTower,0,220);
  image(greenTower,1760,220);
  image(towerHealthBar, 20 , 265);
  image(towerHealthBar, width-58 , 265);

  // -player
  image(bolbNormal, 160, 60);
  image(kappaNormal, 1460, 60,300,130);

  // Variable
  // -round
  round = 0;
  
  // -timer
  gameTimer = GAME_SET_TIME;
  
  // -choose
  redChooseX = 160; 
  redChooseY = 220;
  greenChooseX = 1680; 
  greenChooseY = 220;  
  
  // -bar
  redItembar = new Bar(6, itemBar);
  greenItembar = new Bar(6, itemBar);
  redBottlebar = new Bar(3, bottleBarLeft);
  greenItembar = new Bar(3, bottleBarRight);
      
  // -land
  for(int col = 0; col < COL_NUM; col++){
    for(int row = 0; row < ROW_NUM; row++){
      if(col == 0 || col == 1){
        lands[col][row] = new Land(col, row, RED);
        redLandNum = ROW_NUM * 2;
      }else if(col == 18 || col == 19){
        lands[col][row] = new Land(col, row, GREEN);
        greenLandNum = ROW_NUM * 2;
      }else lands[col][row] = new Land(col, row, OWNERLESS);
    }
  }
  
  // -item
  randomBall();
  for(int i = 0; i < items.length; i++){
    for(int j = 0; j < items[i].length; j++){
      items[i][j] = null;
    }
  }  
      
  // -bottle
  for(int i = 0; i < bottles.length; i++){
    for(int j = 0; j < bottles[i].length; j++){
      bottles[i][j] = null;
    }
  }
}

void draw(){
  switch(gameState){
    
    case GAME_START:
    image(gamestart, 0, 0);

    if(START_BUTTON_X + START_BUTTON_WIDTH > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_HEIGHT > mouseY
      && START_BUTTON_Y < mouseY) {
      image(startHovered, START_BUTTON_X, START_BUTTON_Y);
      
      if(mousePressed){
        gameState = GAME_INTRO;
        round = 0;
        gameTimer = GAME_SET_TIME * (round + 1);
      }

    }else{
      image(startNormal, START_BUTTON_X, START_BUTTON_Y);

    }    
    break;
     
    case GAME_INTRO:
    //int count;
    //switch(count){
    //  case 0:
    //  image(gameread,0,0);
    //  break;
    //  case 1:
    //  image(gameread2,0,0);
    //  break;
    //  case 2:
    //  image(gameread3,0,0);         
    //  break;
    //  case 3:
    //  gameState = GAME_SET;
    //}
    if(SKIP_BUTTON_X + SKIP_BUTTON_WIDTH > mouseX
      && SKIP_BUTTON_X < mouseX
      && SKIP_BUTTON_Y + SKIP_BUTTON_HEIGHT > mouseY
      && SKIP_BUTTON_Y < mouseY) {
    
      image(skipHovered, SKIP_BUTTON_X, SKIP_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_SET;
        mousePressed = false;
      }    
    }else{
    
      image(skipNormal, SKIP_BUTTON_X, SKIP_BUTTON_Y);    
    }
    break;
      
    case GAME_SET:      
    // Display
    // -background
    image(bg, 0, 0, 1920, 1080);
    timeCountdown();
    showRound();
    
    // -bar
    redItemBar.display(20);
    greenItemBar.display(width - greenItemBar.w - 20);
    redBottleBar.display(630);
    greenBottleBar.display(width - greenBottleBar.w - 630);
    redItemBar.textNumber();
    greenItemBar.textNumber();
    redBottleBar.textNumber();
    greenBottleBar.textNumber();
    
    // -land
    for(int col = 0; col < COL_NUM; col++){
      for(int row = 0; row < ROW_NUM; row++){
        lands[col][row].display();
      }
    }      
      
    // -item
    if(round > 0) randomBall();
    for(int i = 0; i < balls.length; i++){
      if(balls[i] != null && balls[i].isAlive) balls[i].display();
    }
      
    // -bottle
    for(int i = 0; i < bottles.length; i++){
      for(int j = 0; j < bottles[i].length; j++){
        if(bottles[i][j] != null && bottles[i][j].isAlive){
          bottles[i][j].display();
        }
      }
    }
    
    // -timer
    if (gameTimer == 0){
      gameState = GAME_FIGHT;
      gameTimer = GAME_FIGHT_TIME;
    }else{
      gameTimer--;
      choose();
    }
    break;
    
    case GAME_FIGHT:      
    // Display
    // -background
    image(bg, 0, 0, 1920, 1080);
    timeCountdown();
    showRound();
    
    // -bar
    redItemBar.display(20);
    greenItemBar.display(width - greenItemBar.w - 20);
    redBottleBar.display(630);
    greenBottleBar.display(width - greenBottleBar.w - 630);
    redItemBar.textNumber();
    greenItemBar.textNumber();
    redBottleBar.textNumber();
    greenBottleBar.textNumber();
    
    // -land
    for(int col = 0; col < COL_NUM; col++){
      for(int row = 0; row < ROW_NUM; row++){
        lands[col][row].display();
      }
    }
    
    // -item
    for(int i = 0; i < balls.length; i++){
      if(balls[i] != null && balls[i].isAlive){
        balls[i].display();
        balls[i].checkCollision();
      }
    }
    for(int i = 0; i < items.length; i++){
      for(int j = 0; j < items[i].length; j++){
        if(items[i][j] != null && items[i][j].isAlive){
          items[i][j].display();
          items[i][j].use();
        }
      }
    }

    // -bottle
    for(int i = 0; i < bottles.length; i++){
      for(int j = 0; j < bottles[i].length; j++){
        if(bottles[i][j] != null && bottles[i][j].isAlive){
            bottles[i][j].display();
            bottles[i][j].move();
          }
        }
      }
     
    if(gameTimer == 0){
      if(redTowerHP <= 0 || greenTowerHP <= 0 || round == 2) gameState = GAME_OVER;
      else{
        round++;
        gameState = GAME_SET;
        gameTimer = GAME_SET_TIME * (round + 1);
      }
    }else{
      gameTimer--;
      choose();
    }
    break;
      
    case GAME_OVER:
    image(gameover, 0, 0);
    
    // TEXT
    String winnerText;    
    if(redTowerHP <= 0 ||  redLandNum < greenLandNum){
      winnerText = "THE WINNER IS KAPPA!";
      image(kappaAward, 340, 575, 460, 200);
      image(bolbNormal, 1220, 600);
    }else if(greenTowerHP <= 0 || redLandNum > greenLandNum){
      winnerText = "THE WINNER IS BOLB!";
      image(bolbAward, 340, 575);
      image(kappaNormal, 1220, 600, 460, 200);
    }else winnerText = "EVEN";
    
    textAlign(CENTER);
    textFont(font,50);
    text(winnerText, width / 2, height / 2 - 100);          
    
    // Restart
    if(RESTART_BUTTON_X + RESTART_BUTTON_WIDTH > mouseX
    && RESTART_BUTTON_X < mouseX
    && RESTART_BUTTON_Y + RESTART_BUTTON_HEIGHT > mouseY
    && RESTART_BUTTON_Y < mouseY) {
      
      image(restartHovered, RESTART_BUTTON_X, RESTART_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_SET;
        initGame();
      }      
    }else{      
       image(restartNormal, RESTART_BUTTON_X, RESTART_BUTTON_Y);      
    }         
    break;
  }
}

void randomBall(){
  for(int i = 0; i < 4; i++){  
    int ballCol1 = 2 + i * 4 + floor(random(2));
    int ballRow1 = floor(random(ROW_NUM));
    if(lands[ballCol1][ballRow1].hasBottle) return;
    if(lands[ballCol1][ballRow1].hasItem) return;
    
    int ballCol2 = 2 + i * 4 + floor(random(2, 4));  
    int ballRow2 = floor(random(ROW_NUM));    
    if(lands[ballCol2][ballRow2].hasBottle) return;
    if(lands[ballCol2][ballRow2].hasItem) return;

    int ballRate;
    switch(i){
      case 0:
      if(items[BOMB][7] != null) ballRate = 0;
      else if(items[TRAP][7] != null) ballRate = 1;
      else ballRate = floor(random(2));
      
      if(ballRate == 0){ 
        balls[0 + round * 8] = new Ball(BOMB, itemCol1, itemRow1);
        balls[1 + round * 8] = new Ball(BOMB, itemCol2, itemRow2);
      }else{
        balls[0 + round * 8] = new Ball(TRAP, itemCol1, itemRow1);
        balls[1 + round * 8] = new Ball(TRAP, itemCol2, itemRow2);
      }
      break;
      
      case 1:
      ballRate = floor(random(10));
      if(ballRate == 0){ 
        balls[2 + round * 8] = new Ball(BANANA, itemCol1, itemRow1);
        balls[3 + round * 8] = new Ball(BANANA, itemCol2, itemRow2);
      }else{
        balls[2 + round * 8] = new Ball(DOOR, itemCol1, itemRow1);
        balls[3 + round * 8] = new Ball(DOOR, itemCol2, itemRow2);
      }
      break;
      
      case 2:
      ballRate = floor(random(10));
      if(ballRate == 0){ 
        balls[4 + round * 8] = new Ball(ICE, itemCol1, itemRow1);
        balls[5 + round * 8] = new Ball(ICE, itemCol2, itemRow2);
      }else{
        balls[4 + round * 8] = new Ball(BLOOD, itemCol1, itemRow1);
        balls[5 + round * 8] = new Ball(BLOOD, itemCol2, itemRow2);
      }
      break;
      
      case 3:
      if(items[BOMB][7] != null) ballRate = 0;
      else if(items[TRAP][7] != null) ballRate = 1;
      else ballRate = floor(random(2));

      if(itemRate == 0){ 
        balls[6 + round * 8] = new Ball(BOMB, itemCol1, itemRow1);
        balls[7 + round * 8] = new Ball(BOMB, itemCol2, itemRow2);
      }else{
        balls[6 + round * 8] = new Ball(TRAP, itemCol1, itemRow1);
        balls[7 + round * 8] = new Ball(TRAP, itemCol2, itemRow2);
      }
      break;
    }
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

void showRoundPic(){
float picX, picY; 
picX = -960;
picY = height/2;
//image(CENTER);
if(round == 0 ) image(round1,picX,picY);
if(round == 1 ) image(round2,picX,picY);
if(round == 2 ) image(round3,picX,picY);
picX++; 
}
  
void drawGameRound(String text, color textColor){
  textSize(50);
  textAlign(CENTER);
  fill(0,120);
  text(text, 200, 200);
  fill(textColor);
  text(text, 200, 200);
}

String convertFrameToTimeString(int frames){
  String result = "";
  float totalSeconds = float(frames) / 40;
  result += nf(round(totalSeconds), 2);
  
  return result;
}

void showRound(){
  textFont(font,110);
  textAlign(CENTER);
  String roundString = "ROUND:" + (round+1);
  fill(0, 120);  
  text(roundString, width/2, 200);
  fill(#00ffff);
  text(roundString, width/2+10, 210);
}

void timeCountdown(){ 
  textFont(font,110);
  textAlign(CENTER);
  String timeString = convertFrameToTimeString(gameTimer);
  timeString = "TIME:" + timeString;
  fill(0, 120);  
  text(timeString, width/2, 100);
  fill(#00ffff);
  text(timeString, width/2+10, 110);
  
  
}

void choose(){
  image(redChoose, redChooseX, redChooseY);
  if(redChooseX<=160)redChooseX = 160;
  if(redChooseX>=width-240)redChooseX = width-240;
  if(redChooseY<=220)redChooseY = 220;
  if(redChooseY>=height-300)redChooseY = height-300;
  
  image(greenChoose, greenChooseX, greenChooseY);  
  if(greenChooseX<=160)greenChooseX = 160;
  if(greenChooseX>=width-240)greenChooseX = width-240;
  if(greenChooseY<=220)greenChooseY = 220;
  if(greenChooseY>=height-300)greenChooseY = height-300;
}

void keyPressed(){
  //if(gameState == GAME_READ) count++;
  if(gameState == GAME_SET){
    if(key==CODED){
      //Green choose
      switch(keyCode){
      case LEFT:
      if(greenChooseCol > 0 && lands[greenChooseCol - 1][greenChooseRow].camp == GREEN){
        greenChooseX -= 80;
        greenChooseCol -= 1;
      }
      break;
      case RIGHT:
      if(greenChooseCol < 19 && lands[greenChooseCol + 1][greenChooseRow].camp == GREEN){
        greenChooseX += 80;
        greenChooseCol += 1;
      }
      break;
      case DOWN:
      if(greenChooseRow < 7 && lands[greenChooseCol][greenChooseRow + 1].camp == GREEN){
        greenChooseY += 80;
        greenChooseRow += 1;
      }
      break;
      case UP:
      if(greenChooseRow > 0 && lands[greenChooseCol][greenChooseRow - 1].camp == GREEN){
        greenChooseY -= 80;
        greenChooseRow -= 1;
      }
      break;
      }
    }
      //Red choose
      switch(key){
      case 'a':
      if(redChooseCol > 0 && lands[redChooseCol - 1][redChooseRow].camp == RED){
        redChooseX -= 80;
        redChooseCol -= 1;
      }
      break;
      case 'd':
      if(redChooseCol < 19 && lands[redChooseCol + 1][redChooseRow].camp == RED){
        redChooseX += 80;
        redChooseCol += 1;
      }
      break;
      case 's':
      if(redChooseRow < 7 && lands[redChooseCol][redChooseRow + 1].camp == RED){
        redChooseY += 80;
        redChooseRow += 1;
      }
      break;
      case 'w':
      if(redChooseRow > 0 && lands[redChooseCol][redChooseRow - 1].camp == RED){
        redChooseY -= 80;
        redChooseRow -= 1;
      }
      break;
      
      //Put red bottle
    case 'z':
    if(lands[redChooseCol][redChooseRow].hasBottle == false ){
    bottles[0][redBottleUsed] = new SmallBottle(RED, redChooseCol, redChooseRow);
    redBottleUsed++;
    redSmallBottleAVL--;
    lands[redChooseCol][redChooseRow].hasBottle = true;
    }
    break;
    case 'x':
    if(lands[redChooseCol][redChooseRow].hasBottle == false
    && redChooseCol > 0 && redChooseCol < 19
    && redChooseRow > 0 && redChooseRow < 7){
    bottles[0][redBottleUsed] = new MiddleBottle(RED, redChooseCol, redChooseRow);
    redBottleUsed++;
    redMiddleBottleAVL--;
    lands[redChooseCol][redChooseRow].hasBottle = true;
    }
    break;
    case 'c':
    if(redChooseRow < 6 && lands[redChooseCol][redChooseRow].hasBottle == false
    && lands[redChooseCol][redChooseRow + 1].hasBottle == false
    && lands[redChooseCol][redChooseRow + 2].hasBottle == false){
    bottles[0][redBottleUsed] = new LargeBottle(RED, redChooseCol, redChooseRow);
    redBottleUsed++;
    redLargeBottleAVL--;
    for(int i = 0; i < 3; i++){
    lands[redChooseCol][redChooseRow + i].hasBottle = true;
    }
    }
    break;
    
    //Put green bottle
    case '1':
    if(lands[greenChooseCol][greenChooseRow].hasBottle == false){
    bottles[1][greenBottleUsed] = new SmallBottle(GREEN, greenChooseCol, greenChooseRow);
    greenBottleUsed++;
    greenSmallBottleAVL--;
    lands[greenChooseCol][greenChooseRow].hasBottle = true;
    }
    break;
    case '2':
    if(lands[greenChooseCol][greenChooseRow].hasBottle == false
    && greenChooseCol > 0 && greenChooseCol < 19
    && greenChooseRow > 0 && greenChooseRow < 7){
    bottles[1][greenBottleUsed] = new MiddleBottle(GREEN, greenChooseCol, greenChooseRow);
    greenBottleUsed++;
    greenMiddleBottleAVL--;
    lands[greenChooseCol][greenChooseRow].hasBottle = true;
    }
    break;
    case '3':
    if(greenChooseRow < 6 && lands[greenChooseCol][greenChooseRow].hasBottle == false
    && lands[greenChooseCol][greenChooseRow + 1].hasBottle == false
    && lands[greenChooseCol][greenChooseRow + 2].hasBottle == false){
    bottles[1][greenBottleUsed] = new LargeBottle(GREEN, greenChooseCol, greenChooseRow);
    greenBottleUsed++;
    greenLargeBottleAVL--;
    for(int i = 0; i < 3; i++){
    lands[greenChooseCol][greenChooseRow + i].hasBottle = true;
    }
    }
    break;
    }
    }
    
  if(gameState == GAME_FIGHT){ //<>//
    switch(keyCode){
      case LEFT:
      if(greenChooseCol > 0 && lands[greenChooseCol - 1][greenChooseRow].camp == GREEN){
      greenChooseX -= 80;
      greenChooseCol -= 1;
      }
      break;
      case RIGHT:
      if(greenChooseCol < 19 && lands[greenChooseCol + 1][greenChooseRow].camp == GREEN){
      greenChooseX += 80;
      greenChooseCol += 1;
      }
      break;
      case DOWN:
      if(greenChooseRow < 7 && lands[greenChooseCol][greenChooseRow + 1].camp == GREEN){
      greenChooseY += 80;
      greenChooseRow += 1;
      }
      break;
      case UP:
      if(greenChooseRow > 0 && lands[greenChooseCol][greenChooseRow - 1].camp == GREEN){
      greenChooseY -= 80;
      greenChooseRow -= 1;
      }
      break;
      }
    
    
    switch(key){
      case 'a':
        if(redChooseCol > 0 && lands[redChooseCol - 1][redChooseRow].camp == RED){
        redChooseX -= 80;
        redChooseCol -= 1;
        }
        break;
        case 'd':
        if(redChooseCol < 19 && lands[redChooseCol + 1][redChooseRow].camp == RED){
        redChooseX += 80;
        redChooseCol += 1;
        }
        break;
        case 's':
        if(redChooseRow < 7 && lands[redChooseCol][redChooseRow + 1].camp == RED){
        redChooseY += 80;
        redChooseRow += 1;
        }
        break;
        case 'w':
        if(redChooseRow > 0 && lands[redChooseCol][redChooseRow - 1].camp == RED){
        redChooseY -= 80;
        redChooseRow -= 1;
        }
        break;
       
        
        
      //case  'z' :
     // for(int k=0; k<items.length; k++){
     //   if(items[k]!= null){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 1 && redItemBar.barNumber[BLOOD]>0){
     //         items[k].isAlive = true;
     //         items[k].display();
     //         redItemBar.barNumber[BLOOD]--;                
     //         items[k].x=redChooseX;
     //         items[k].y=redChooseY;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  'x' :
     // for(int k=0; k<items.length; k++){
     //   if(items[k]!= null){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 2 && redItemBar.barNumber[BANANA]>0){
     //         items[k].isAlive = true;
     //         items[k].display();
     //         redItemBar.barNumber[BANANA]--;                
     //         items[k].x=redChooseX;
     //         items[k].y=redChooseY;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  'c' :
     // for(int k=0; k<items.length; k++){
     //   if(items[k]!= null){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 3 && redItemBar.barNumber[DOOR]>0){
     //         items[k].isAlive = true;
     //         items[k].display();
     //         redItemBar.barNumber[DOOR]--;                
     //         items[k].x=redChooseX;
     //         items[k].y=redChooseY;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  'v' :
     // for(int k=0; k<items.length; k++){
     //   if(items[k]!= null ){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 4 && redItemBar.barNumber[BOMB]>0){
     //         items[k].isAlive = true;
     //         items[k].display();
     //         redItemBar.barNumber[BOMB]--;                
     //         items[k].x=redChooseX;
     //         items[k].y=redChooseY;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  'b' :
     // for(int k=0; k<items.length; k++){
     //   if(items[k]!= null){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 5 && redItemBar.barNumber[ICE]>0){
              
     //         redItemBar.barNumber[ICE]--;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  'n' :
     //   for(int k=0; k<items.length; k++){
     //     if(items[k]!= null ){
     //       if(items[k].itemState == ITEM_USE_STATE){
     //         if(items[k].itemKind == 6 && redItemBar.barNumber[TRAP]>0){
     //           items[k].isAlive = true;
     //           items[k].display();
     //           redItemBar.barNumber[TRAP]--;                
     //           items[k].x=redChooseX;
     //           items[k].y=redChooseY;
     //         }
     //       }
     //     }
     //   }
     //     break ;
     // case  '1' :
     // for(int k=0; k<items.length; k++){
     //   if(items[k]!= null){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 1 && greenItemBar.barNumber[BLOOD]>0){
     //         items[k].isAlive = true;
     //         items[k].display();
     //         greenItemBar.barNumber[BLOOD]--;                
     //         items[k].x=greenChooseX;
     //         items[k].y=greenChooseY;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  '2' :
     // for(int k=0; k<items.length; k++){
     //   if(items[k]!= null){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 2 && greenItemBar.barNumber[BANANA]>0){
     //         items[k].isAlive = true;
     //         items[k].display();
     //         greenItemBar.barNumber[BANANA]--;                
     //         items[k].x=greenChooseX;
     //         items[k].y=greenChooseY;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  '3' :
     //  for(int k=0; k<items.length; k++){
     //   if(items[k]!= null){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 3 && greenItemBar.barNumber[DOOR]>0){
     //         items[k].isAlive = true;
     //         items[k].display();
     //         greenItemBar.barNumber[DOOR]--;                
     //         items[k].x=greenChooseX;
     //         items[k].y=greenChooseY;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  '4' :
     // for(int k=0; k<items.length; k++){
     //   if(items[k]!= null ){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 4 && greenItemBar.barNumber[BOMB]>0){
     //         items[k].isAlive = true;
     //         items[k].display();
     //         greenItemBar.barNumber[BOMB]--;                
     //         items[k].x=greenChooseX;
     //         items[k].y=greenChooseY;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  '5' :
     //for(int k=0; k<items.length; k++){
     //   if(items[k]!= null){
     //     if(items[k].itemState == ITEM_USE_STATE){
     //       if(items[k].itemKind == 5 && greenItemBar.barNumber[ICE]>0){
              
     //         greenItemBar.barNumber[ICE]--;
     //       }
     //     }
     //   }
     // }
     //     break ;
     // case  '6' :
     // for(int k=0; k<items.length; k++){
     //     if(items[k]!= null ){
     //       if(items[k].itemState == ITEM_USE_STATE){
     //         if(items[k].itemKind == 6 && greenItemBar.barNumber[TRAP]>0){
     //           items[k].isAlive = true;
     //           items[k].display();
     //           greenItemBar.barNumber[TRAP]--;                
     //           items[k].x=greenChooseX;
     //           items[k].y=greenChooseY;
     //         }
     //       }
     //     }
     //   }
     //     break ;    

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

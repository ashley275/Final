// Music
import ddf.minim.*;
Minim minim;
AudioPlayer song;
AudioPlayer attack;
AudioPlayer bottleDie;
AudioPlayer towerDamage;
AudioPlayer towerDie;

// Image
// -page
PImage bg, gamestart, gameover, gameread, gameread2, gameread3;
PImage startNormal, startHovered, restartNormal, restartHovered, skipNormal, skipHovered ;
PImage round1, round2,round3;

// -scene
PImage itemBar, bottleBarLeft, bottleBarRight;
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
final int GAME_START = 0, GAME_INTRO = 1, GAME_SET = 2, GAME_FIGHT = 3, GAME_OVER = 4, GAME_ROUND = 5;
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
int [][] roundBottleNum = new int [3][3];
  
final int MAX_BOTTLE_NUM = 54;

// -land
final int LAND_SIZE = 80;
final int COL_NUM = 20, ROW_NUM = 8;
int redLandNum = 0, greenLandNum = 0;

// Class
Tower redTower;
Tower greenTower;

Land lands[][];
Bottle bottles[][];
Item items[][];
Ball balls[];

Bar redItemBar;
Bar greenItemBar;
Bar redBottleBar;
Bar greenBottleBar;
Tower towers;
RoundPic roundPic;

// Font
PFont abc;

void setup() {
  // Set
  size(1920,1080);
  frameRate(40);
  
  // Music
  minim = new Minim(this);
  song = minim.loadFile("song.mp3", 1024);
  song.play();
  song.loop();
  attack = minim.loadFile("attack.mp3", 1024);
  bottleDie = minim.loadFile("bottleDie.mp3", 1024);
  towerDamage = minim.loadFile("towerDamage.mp3", 1024);
  towerDie = minim.loadFile("towerDie.mp3", 1024);
  
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
  

  
  // -choose
  redChoose = loadImage("img/choose/redChoose.png");
  greenChoose = loadImage("img/choose/greenChoose.png");
  redChooseProp = loadImage("img/choose/redChooseProp.png");
  greenChooseProp = loadImage("img/choose/greenChooseProp.png");
  
  // -bar
  itemBar = loadImage("img/scene/itemBar.png");
  bottleBarLeft = loadImage("img/scene/redBottleBar.png");
  bottleBarRight = loadImage("img/scene/greenBottleBar.png");  
     
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
  
  // Bottle mum
  roundBottleNum [0][BOTTLE_SMALL] = 5;
  roundBottleNum [0][BOTTLE_MIDDLE] = 2;
  roundBottleNum [0][BOTTLE_LARGE] = 1;
  roundBottleNum [1][BOTTLE_SMALL] = 15;
  roundBottleNum [1][BOTTLE_MIDDLE] = 5;
  roundBottleNum [1][BOTTLE_LARGE] = 3;
  roundBottleNum [2][BOTTLE_SMALL] = 15;
  roundBottleNum [2][BOTTLE_MIDDLE] = 5;
  roundBottleNum [2][BOTTLE_LARGE] = 3;
  
  // Class
  items = new Item[6][8];  
  bottles = new Bottle[2][MAX_BOTTLE_NUM];
  lands = new Land[COL_NUM][ROW_NUM];  
  balls = new Ball[24];
  towers = new Tower();

  
  redItemBar = new Bar(6, itemBar);
  greenItemBar = new Bar(6, itemBar);
  redBottleBar = new Bar(3, bottleBarRight);
  greenBottleBar = new Bar(3, bottleBarLeft);

  // Font      
  abc = createFont("abc.ttf", 100);
  
  initGame();  
}


void initGame(){
  // Image
  // -tower
  towers = new Tower();


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
  redItemBar = new Bar(6, itemBar);
  greenItemBar = new Bar(6, itemBar);
  redBottleBar = new Bar(3, bottleBarLeft);
  greenBottleBar = new Bar(3, bottleBarRight);
      
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
  addBottle();
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
    
    // -player
    image(bolbNormal, 160, 60);
    image(kappaNormal, 1460, 60,300,130);
    
    // -tower
    towers.display();
    
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
        if(lands[col][row].camp != OWNERLESS) lands[col][row].display();
      }
    }      
      
    // -item
    for(int i = 0; i < balls.length; i++){
      if(balls[i] != null && balls[i].isAlive) balls[i].display();
    }
    for(int i = 0; i < items.length; i++){
      for(int j = 0; j < items.length; j++){
        if(items[i][j] != null && items[i][j].isAlive) {
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
    
    // -player
    image(bolbNormal, 160, 60);
    image(kappaNormal, 1460, 60,300,130);
    
    // -tower
    towers.display();
    
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
        if(lands[col][row].camp != OWNERLESS) lands[col][row].display();
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
    if(redTowerHP <= 0 || greenTowerHP <= 0) gameState = GAME_OVER; 
    if(gameTimer == 0){
      if(round == 2) gameState = GAME_OVER;
      else{
        round++;        
        
        roundPic = new RoundPic();
        gameState = GAME_ROUND;
               
      }
    }else{
      gameTimer--;
      choose();
    }
    break;
      
    case GAME_OVER:
    image(gameover, 0, 0);
    bottleDie.play();

    // TEXT
    String winnerText;    
    if(redTowerHP <= 0 ||  redLandNum < greenLandNum){
      fill(0);
      winnerText = "THE WINNER IS KAPPA!";
      image(kappaAward, 340, 575, 460, 200);
      image(bolbNormal, 1220, 600);
    }else if(greenTowerHP <= 0 || redLandNum > greenLandNum){
      winnerText = "THE WINNER IS BOLB!";
      image(bolbAward, 340, 575);
      image(kappaNormal, 1220, 600, 460, 200);
    }else winnerText = "EVEN";
    
    textAlign(CENTER);
    textFont(abc,50);
    text(winnerText, width / 2, height / 2 - 250);          
    
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
    
    case GAME_ROUND:
    
    displayScene();
    roundPic.display();
    
    if(!roundPic.isAlive){      
      randomBall();
      addBottle();
      gameTimer = GAME_SET_TIME * (round + 1);
      gameState = GAME_SET;
    }
    break;
  }
}

void displayScene(){
  image(bg, 0, 0, 1920, 1080);
  timeCountdown();
  showRound();
  image(bolbNormal, 160, 60);
  image(kappaNormal, 1460, 60,300,130);
  towers.display();
  redItemBar.display(20);
  greenItemBar.display(width - greenItemBar.w - 20);
  redBottleBar.display(630);
  greenBottleBar.display(width - greenBottleBar.w - 630);
  redItemBar.textNumber();
  greenItemBar.textNumber();
  redBottleBar.textNumber();
  greenBottleBar.textNumber();
  for(int col = 0; col < COL_NUM; col++){
    for(int row = 0; row < ROW_NUM; row++){
      if(lands[col][row].camp != OWNERLESS) lands[col][row].display();
    }
  }
  for(int i = 0; i < balls.length; i++){
    if(balls[i] != null && balls[i].isAlive){
      balls[i].display();
    }
  }
  for(int i = 0; i < items.length; i++){
    for(int j = 0; j < items[i].length; j++){
      if(items[i][j] != null && items[i][j].isAlive){
        items[i][j].display();
      }
    }
  }
  for(int i = 0; i < bottles.length; i++){
    for(int j = 0; j < bottles[i].length; j++){
      if(bottles[i][j] != null && bottles[i][j].isAlive){
        bottles[i][j].display();
      }
    }
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
        balls[0 + round * 8] = new Ball(BOMB, ballCol1, ballRow1);
        balls[1 + round * 8] = new Ball(BOMB, ballCol2, ballRow2);
      }else{
        balls[0 + round * 8] = new Ball(TRAP, ballCol1, ballRow1);
        balls[1 + round * 8] = new Ball(TRAP, ballCol2, ballRow2);
      }
      break;
      
      case 1:
      ballRate = floor(random(10));
      if(ballRate == 0){ 
        balls[2 + round * 8] = new Ball(BANANA, ballCol1, ballRow1);
        balls[3 + round * 8] = new Ball(BANANA, ballCol2, ballRow2);
      }else{
        balls[2 + round * 8] = new Ball(DOOR, ballCol1, ballRow1);
        balls[3 + round * 8] = new Ball(DOOR, ballCol2, ballRow2);
      }
      break;
      
      case 2:
      ballRate = floor(random(10));
      if(ballRate == 0){ 
        balls[4 + round * 8] = new Ball(ICE, ballCol1, ballRow1);
        balls[5 + round * 8] = new Ball(ICE, ballCol2, ballRow2);
      }else{
        balls[4 + round * 8] = new Ball(BLOOD, ballCol1, ballRow1);
        balls[5 + round * 8] = new Ball(BLOOD, ballCol2, ballRow2);
      }
      break;
      
      case 3:
      if(items[BOMB][7] != null) ballRate = 0;
      else if(items[TRAP][7] != null) ballRate = 1;
      else ballRate = floor(random(2));

      if(ballRate == 0){ 
        balls[6 + round * 8] = new Ball(BOMB, ballCol1, ballRow1);
        balls[7 + round * 8] = new Ball(BOMB, ballCol2, ballRow2);
      }else{
        balls[6 + round * 8] = new Ball(TRAP, ballCol1, ballRow1);
        balls[7 + round * 8] = new Ball(TRAP, ballCol2, ballRow2);
      }
      break;
    }
  }
}

void addBottle(){
  for(int i = 0; i < 3; i++){
    redBottleBar.number[i] += roundBottleNum[round][i];
    greenBottleBar.number[i] += roundBottleNum[round][i];
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
  textFont(abc,110);
  textAlign(CENTER);
  String roundString = "ROUND:" + (round+1);
  fill(0, 120);  
  text(roundString, width/2, 200);
  fill(#00ffff);
  text(roundString, width/2+10, 210);
}

void timeCountdown(){ 
  textFont(abc, 110);
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
  switch(gameState){
    case GAME_SET:
    if(key==CODED){
      //Green choose
      switch(keyCode){
        case LEFT:
        if(greenChooseCol > 0){
          greenChooseX -= 80;
          greenChooseCol -= 1;
        }
        break;
        case RIGHT:
        if(greenChooseCol < 19){
          greenChooseX += 80;
          greenChooseCol += 1;
        }
        break;
        case DOWN:
        if(greenChooseRow < 7){
          greenChooseY += 80;
          greenChooseRow += 1;
        }
        break;
        case UP:
        if(greenChooseRow > 0){
          greenChooseY -= 80;
          greenChooseRow -= 1;
        }
        break;
      }
    }
    //Red choose
    switch(key){
      case 'a':
      if(redChooseCol > 0){
        redChooseX -= 80;
        redChooseCol -= 1;
      }
      break;
      case 'd':
      if(redChooseCol < 19){
        redChooseX += 80;
        redChooseCol += 1;
      }
      break;
      case 's':
      if(redChooseRow < 7){
        redChooseY += 80;
        redChooseRow += 1;
      }
      break;
      case 'w':
      if(redChooseRow > 0){
        redChooseY -= 80;
        redChooseRow -= 1;
      }
      break;
      
    //Put red bottle
      case 'z':
      if(lands[redChooseCol][redChooseRow].camp == RED
      && redBottleBar.number[BOTTLE_SMALL] > 0
      && !lands[redChooseCol][redChooseRow].hasBottle
      && !lands[redChooseCol][redChooseRow].hasItem){
        bottles[0][redBottleUsed] = new SmallBottle(RED, redChooseCol, redChooseRow);
        redBottleUsed++;
        redBottleBar.number[BOTTLE_SMALL]--;
        lands[redChooseCol][redChooseRow].hasBottle = true;
      }
      break;
      case 'x':
      if(lands[redChooseCol][redChooseRow].camp == RED && redBottleBar.number[BOTTLE_MIDDLE] > 0
      && redChooseCol > 0 && redChooseCol < 19 && redChooseRow > 0 && redChooseRow < 7
      && !lands[redChooseCol][redChooseRow].hasBottle
      && !lands[redChooseCol][redChooseRow].hasItem){
        bottles[0][redBottleUsed] = new MiddleBottle(RED, redChooseCol, redChooseRow);
        redBottleUsed++;
        redBottleBar.number[BOTTLE_MIDDLE]--;
        lands[redChooseCol][redChooseRow].hasBottle = true;
      }
      break;
      case 'c':
      if(lands[redChooseCol][redChooseRow].camp == RED && redChooseRow < 6 && redBottleBar.number[BOTTLE_LARGE] > 0
      && !lands[redChooseCol][redChooseRow].hasBottle && !lands[redChooseCol][redChooseRow].hasItem
      && !lands[redChooseCol][redChooseRow + 1].hasBottle && !lands[redChooseCol][redChooseRow + 1].hasItem
      && !lands[redChooseCol][redChooseRow + 2].hasBottle && !lands[redChooseCol][redChooseRow + 2].hasItem){
        bottles[0][redBottleUsed] = new LargeBottle(RED, redChooseCol, redChooseRow);
        redBottleUsed++;
        redBottleBar.number[BOTTLE_LARGE]--;
        for(int i = 0; i < 3; i++){
          lands[redChooseCol][redChooseRow + i].hasBottle = true;
        }
      }
      break;
    
    //Put green bottle
      case '1':
      if(lands[greenChooseCol][greenChooseRow].camp == GREEN
      && greenBottleBar.number[BOTTLE_SMALL] > 0
      && !lands[greenChooseCol][greenChooseRow].hasBottle
      && !lands[greenChooseCol][greenChooseRow].hasItem){
        bottles[1][greenBottleUsed] = new SmallBottle(GREEN, greenChooseCol, greenChooseRow);
        greenBottleUsed++;
        greenBottleBar.number[BOTTLE_SMALL]--;
        lands[greenChooseCol][greenChooseRow].hasBottle = true;
      }
      break;
      case '2':
      if(lands[greenChooseCol][greenChooseRow].camp == GREEN && greenBottleBar.number[BOTTLE_MIDDLE] > 0
      && greenChooseCol > 0 && greenChooseCol < 19 && greenChooseRow > 0 && greenChooseRow < 7
      && !lands[greenChooseCol][greenChooseRow].hasBottle
      && !lands[greenChooseCol][greenChooseRow].hasItem){
        bottles[1][greenBottleUsed] = new MiddleBottle(GREEN, greenChooseCol, greenChooseRow);
        greenBottleUsed++;
        greenBottleBar.number[BOTTLE_MIDDLE]--;
        lands[greenChooseCol][greenChooseRow].hasBottle = true;
      }
      break;
      case '3':
      if(lands[greenChooseCol][greenChooseRow].camp == GREEN && greenChooseRow < 6 && greenBottleBar.number[BOTTLE_LARGE] > 0
      && !lands[greenChooseCol][greenChooseRow].hasBottle && !lands[greenChooseCol][greenChooseRow].hasItem
      && !lands[greenChooseCol][greenChooseRow + 1].hasBottle && !lands[greenChooseCol][greenChooseRow + 1].hasItem
      && !lands[greenChooseCol][greenChooseRow + 2].hasBottle && !lands[greenChooseCol][greenChooseRow + 2].hasItem){
        bottles[1][greenBottleUsed] = new LargeBottle(GREEN, greenChooseCol, greenChooseRow);
        greenBottleUsed++;
        greenBottleBar.number[BOTTLE_LARGE]--;
        for(int i = 0; i < 3; i++){
          lands[greenChooseCol][greenChooseRow + i].hasBottle = true;
        }
      }
      break;
    }
    break;
    
    case GAME_FIGHT:
    switch(keyCode){
    //Green choose
      case LEFT:
      if(greenChooseCol > 0){
        greenChooseX -= 80;
        greenChooseCol -= 1;
      }
      break;
      case RIGHT:
      if(greenChooseCol < 19){
        greenChooseX += 80;
        greenChooseCol += 1;
      }
      break;
      case DOWN:
      if(greenChooseRow < 7){
        greenChooseY += 80;
        greenChooseRow += 1;
      }
      break;
      case UP:
      if(greenChooseRow > 0){
        greenChooseY -= 80;
        greenChooseRow -= 1;
      }
      break;
    }
      
      
    switch(key){
    //Red choose
      case 'a':
      if(redChooseCol > 0){
        redChooseX -= 80;
        redChooseCol -= 1;
      }
      break;
      case 'd':
      if(redChooseCol < 19){
        redChooseX += 80;
        redChooseCol += 1;
      }
      break;
      case 's':
      if(redChooseRow < 7){
        redChooseY += 80;
        redChooseRow += 1;
      }
      break;
      case 'w':
      if(redChooseRow > 0){
        redChooseY -= 80;
        redChooseRow -= 1;
      }
      break;                 
       
    //Put red item
      case  'z' :
      if(lands[redChooseCol][redChooseRow].hasItem == false && redItemBar.number[BLOOD] > 0){
        for(int i = 0; i < items[BLOOD].length; i++){
          if(items[BLOOD][i] == null){
            items[BLOOD][i] = new Blood(redChooseCol, redChooseRow);
            redItemBar.number[BLOOD]--;
            break;
          }
        }
      }
      break ;
      case  'x' :
      if(lands[redChooseCol][redChooseRow].hasItem == false && redItemBar.number[BANANA] > 0){
        for(int i = 0; i < items[BANANA].length; i++){
          if(items[BANANA][i] == null){
            items[BANANA][i] = new Banana(redChooseCol, redChooseRow);
            redItemBar.number[BANANA]--;
            break;
          }
        }
      }
      break ;
      case  'c' :
      if(lands[redChooseCol][redChooseRow].hasItem == false && redItemBar.number[DOOR] > 0){
        for(int i = 0; i < items[DOOR].length; i++){
          if(items[DOOR][i] == null){
            items[DOOR][i] = new Door(redChooseCol, redChooseRow);
            redItemBar.number[DOOR]--;
            break;
          }
        }
      }
      break ;
      case  'v' :
      if(lands[redChooseCol][redChooseRow].hasItem == false && redItemBar.number[BOMB] > 0){
        for(int i = 0; i < items[BOMB].length; i++){
          if(items[BOMB][i] == null){
            items[BOMB][i] = new Bomb(redChooseCol, redChooseRow);
            redItemBar.number[BOMB]--;
            break;
          }
        }
      }
      break ;
      case  'b' :
      if(lands[redChooseCol][redChooseRow].hasItem == false && redItemBar.number[ICE] > 0){
        for(int i = 0; i < items[ICE].length; i++){
          if(items[ICE][i] == null){
            items[ICE][i] = new Ice(RED, redChooseCol, redChooseRow);
            redItemBar.number[ICE]--;
            break;
          }
        }
      }
      break ;
      case  'n' :
      if(lands[redChooseCol][redChooseRow].hasItem == false && redItemBar.number[TRAP] > 0){
        for(int i = 0; i < items[TRAP].length; i++){
          if(items[TRAP][i] == null){
            items[TRAP][i] = new Trap(redChooseCol, redChooseRow);
            redItemBar.number[TRAP]--;
            break;
          }
        }
      }
      break ;
      
    //Put green item
      case  '1' :
      if(lands[greenChooseCol][greenChooseRow].hasItem == false && greenItemBar.number[BLOOD] > 0){
        for(int i = 0; i < items[BLOOD].length; i++){
          if(items[BLOOD][i] == null){
            items[BLOOD][i] = new Blood(greenChooseCol, greenChooseRow);
            greenItemBar.number[BLOOD]--;
            break;
          }
        }
      }
      break ;
      case  '2' :
      if(lands[greenChooseCol][greenChooseRow].hasItem == false && greenItemBar.number[BANANA] > 0){
        for(int i = 0; i < items[BANANA].length; i++){
          if(items[BANANA][i] == null){
            items[BANANA][i] = new Banana(greenChooseCol, greenChooseRow);
            greenItemBar.number[BANANA]--;
            break;
          }
        }
      }
      break ;
      case  '3' :
      if(lands[greenChooseCol][greenChooseRow].hasItem == false && greenItemBar.number[DOOR] > 0){
        for(int i = 0; i < items[DOOR].length; i++){
          if(items[DOOR][i] == null){
            items[DOOR][i] = new Door(greenChooseCol, greenChooseRow);
            greenItemBar.number[DOOR]--;
            break;
          }
        }
      }
      break ;
      case  '4' :
      if(lands[greenChooseCol][greenChooseRow].hasItem == false && greenItemBar.number[BOMB] > 0){
        for(int i = 0; i < items[BOMB].length; i++){
          if(items[BOMB][i] == null){
            items[BOMB][i] = new Bomb(greenChooseCol, greenChooseRow);
            greenItemBar.number[BOMB]--;
            break;
          }
        }
      }
      break ;
      case  '5' :
      if(lands[greenChooseCol][greenChooseRow].hasItem == false && greenItemBar.number[ICE] > 0){
        for(int i = 0; i < items[ICE].length; i++){
          if(items[ICE][i] == null){
            items[ICE][i] = new Ice(RED, greenChooseCol, greenChooseRow);
            greenItemBar.number[ICE]--;
            break;
          }
        }
      }
      break ;
      case  '6' :
      if(lands[greenChooseCol][greenChooseRow].hasItem == false && greenItemBar.number[TRAP] > 0){
        for(int i = 0; i < items[TRAP].length; i++){
          if(items[TRAP][i] == null){
            items[TRAP][i] = new Trap(greenChooseCol, greenChooseRow);
            greenItemBar.number[TRAP]--;
            break;
          }
        }
      }
      break ;
    }
    break;
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

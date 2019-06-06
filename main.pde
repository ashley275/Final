PImage bg, gamestart, gameover;
PImage startNormal, startHovered, restartNormal, restartHovered;
PImage redSoldier, blueSoldier, item;


final int GAME_START = 0, GAME_SET = 1, GAME_FIGHT = 2, GAME_OVER = 3;
int gameState = 1;
int round = 0;

final int LAND_SIZE = 80;
final int COL_NUM = 20, ROW_NUM = 8;

int HEALTH_POINT = 500;
int HP1 = HEALTH_POINT;
int HP2 = HEALTH_POINT;

/*
final int START_BUTTON_WIDTH = 144;
final int START_BUTTON_HEIGHT = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
*/

int soldierLevel = 0;
final int SOLDIER_LOW = 1, SOLDIER_MID = 2, SOLDIER_HIGH = 3;
final int RED = 1, BLUE = -1;

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

//Land lands [][];
Soldier soldiers [][];

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
  redSoldier = loadImage("img/red_soldier.jpg");
  blueSoldier = loadImage("img/blue_soldier.jpg");
  item = loadImage("img/item.jpg");
  
  //lands = new Land [COL_NUM][ROW_NUM];
  soldiers = new Soldier [2][MAX_SOLDIER_NUM];
  
}


void initGame(){
  
}

void draw(){
  switch(gameState){
    
    case GAME_START:
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
      //land
      background(255);
      strokeWeight(5);
      for(int i = 0; i < 21; i++){
        line(160 + i * 80, 220, 160 + i * 80, 860);
      }
      for(int i = 0; i < 9; i++){
        line(160, 220 + i * 80, 1760, 220 + i * 80);
      }
      //soldier
      for(int i = 0; i < 2; i++){
        for(int j = 0; j < MAX_SOLDIER_NUM; j++){
          if(soldiers[i][j] != null && soldiers[i][j].isAlive == true){
            soldiers[i][j].display();
          }
        }
      } 
  
    /*
      if 60s passed
      gameState = GAME_FIGHT;
      */
      break;
    
    case GAME_FIGHT:
      //land
      background(255);
      strokeWeight(5);
      for(int i = 0; i < 21; i++){
        line(160 + i * 80, 220, 160 + i * 80, 860);
      }
      for(int i = 0; i < 9; i++){
        line(160, 220 + i * 80, 1760, 220 + i * 80);
      }
      
      //soldier
      for(int i = 0; i < 2; i++){
        for(int j = 0; j < MAX_SOLDIER_NUM; j++){
          if(soldiers[i][j] != null && soldiers[i][j].isAlive == true){
            soldiers[i][j].display();
            soldiers[i][j].move();
          }
        }
      }
      
            
 
    /*
      if (60s passed){
        round++;
        gameState = GAME_SET;
      }
      if ((60s passed && round ==2)|| HP1==0 || HP2 ==0){
          gameState = GAME_OVER;
      }
    */
      break;
      
    case GAME_OVER:
      /*
      if(HP1==0){}
      else if(HP2==0){}
      else if(ground1>ground2){}
      else if(ground2>ground1){}
      else {draw}
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

void keyPressed(){
  if(gameState == GAME_SET){
    if(key==CODED){
      switch(keyCode){
        case LEFT:
          break;
        case RIGHT:
          break;
        case DOWN:
          break;
        case UP:
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
        soldiers[0][redLowSoldierUsed] = new Soldier(RED, 0, redLowSoldierUsed);
        redLowSoldierUsed++;
        redLowSoldierAVL--;
        break;
      case 'b':
        soldiers[1][blueLowSoldierUsed] = new Soldier(BLUE, 19, blueLowSoldierUsed);
        blueLowSoldierUsed++;
        blueLowSoldierAVL--;
        break;
      case 'm':
        move = true;
        break;
    }
  }
  if(gameState == GAME_FIGHT){
    if(key==CODED){
      switch(keyCode){
        case LEFT:
        break;
        case RIGHT:
        break;
        case DOWN:
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
  if(gameState == GAME_SET){
    if(key==CODED){
      switch(keyCode){
        case LEFT:
          break;
        case RIGHT:
          break;
        case DOWN:
          break;
        case UP:
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
    }
  }
  if(gameState == GAME_FIGHT){
    if(key==CODED){
      switch(keyCode){
        case LEFT:
        break;
        case RIGHT:
        break;
        case DOWN:
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
    }
  }
}

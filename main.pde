PImage bg, gamestart, gameover;
PImage startNormal, startHovered, restartNormal, restartHovered;
//PImage ;


final int GAME_START = 0, GAME_SET = 1, GAME_FIGHT = 2, GAME_OVER = 3;
int gameState = 0;
int round = 0;

int HEALTH_POINT = 500;
int HP1 = HEALTH_POINT;
int HP2 = HEALTH_POINT;

/*
final int START_BUTTON_WIDTH = 144;
final int START_BUTTON_HEIGHT = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
*/

void setup() {
  size(1920,1080);
  frameRate(60);
  /*bg = loadImage("img/bg.jpg");
  gamestart = loadImage("img/gamestart.png");
  gameover = loadImage("img/gaemover.png");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  */
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
    /*
      if 60s passed
      gameState = GAME_FIGHT;
      */
      break;
    
    case GAME_FIGHT:
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

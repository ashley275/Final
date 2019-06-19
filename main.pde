boolean samePlace1,samePlace2;
PImage bg, gamestart, gameover;
PImage startNormal, startHovered, restartNormal, restartHovered;
PImage banana, banana1, banana2, banana3, ice, blood, bomb, door, trap;
PImage explosion;
PImage itemBar;
PImage redChoose, greenChoose, redChooseProp, greenChooseProp;
PImage bananaball, iceball, bloodball, bombball, doorball, trapball;

PImage redSoldierNormal, redSoldierMid, redSoldierHigh, redSoldierFighting;
PImage greenSoldierNormal, greenSoldierMid, greenSoldierHigh, greenSoldierFighting;
PImage redLand, greenLand, ownerlessLand;

PImage redTower, greenTower;
PImage towerHealthBar, redTowerHealthBarCover, greenTowerHealthBarCover;

//gamestate
final int GAME_START = 0, GAME_SET = 1, GAME_FIGHT = 2, GAME_OVER = 3;
int gameState = 0;
int round = 0;
int gameTimer = 2400;
final int GAMETIME = 2400;

//HP
int HEALTH_POINT = 500;
int redHP = HEALTH_POINT;
int greenHP = HEALTH_POINT;

//choose
int redChooseX = 160, redChooseY = 220;
int greenChooseX = 1680, greenChooseY = 220;
boolean moveRectAlive = false;
int greenChooseCol = 19, redChooseCol = 0, greenChooseRow = 0, redChooseRow = 0;
int redBottleUsed, greenBottleUsed;
int redSmallBottleAVL, redMiddleBottleAVL, redLargeBottleAVL;
int greenSmallBottleAVL, greenMiddleBottleAVL, greenLargeBottleAVL;

final int BLOOD = 0, BANANA = 1, DOOR = 2, BOMB = 3, ICE = 4, TRAP = 5;
final int ITEM_PICK_STATE = 0,ITEM_USE_STATE = 1;

//land
final int LAND_SIZE = 80;
final int COL_NUM = 20, ROW_NUM = 8;
int redLandNum = 0, greenLandNum = 0;
int RedRectCol = 0, RedRectRow = 0;
int GreenRectCol = 0, GreenRectRow = 0;

//button
/*
final int START_BUTTON_WIDTH = 144;
final int START_BUTTON_HEIGHT = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;
*/

//soldier
int soldierLevel = 0;
final int SOLDIER_LOW = 0, SOLDIER_MID = 1, SOLDIER_HIGH = 2;
final int RED = 1, GREEN = -1, OWNERLESS = 0;

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
int greenLowSoldierUsed = 0;
int redLowSoldierAVL = 0;
int greenLowSoldierAVL = 0;
int redMidSoldierUsed = 0;
int greenMidSoldierUsed = 0;
int redMidSoldierAVL = 0;
int greenMidSoldierAVL = 0;
int redHighSoldierUsed = 0;
int greenHighSoldierUsed = 0;
int redHighSoldierAVL = 0;
int greenHighSoldierAVL = 0;

Land lands [][];
Bottle bottles [][];
Item items [];
Bar redItemBar;
Bar greenItemBar;

boolean move = false;

void setup() {
  size(1920,1080);
  frameRate(40);
  bg = loadImage("img/bg.png");
  /*gamestart = loadImage("img/gamestart.png");
  gameover = loadImage("img/gameover.png");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  */
  //choose
  redChoose = loadImage("img/redChoose.png");
  greenChoose = loadImage("img/greenChoose.png");
  redChooseProp = loadImage("img/redChooseProp.png");
  greenChooseProp = loadImage("img/greenChooseProp.png");
  
  //item
  itemBar = loadImage("img/itemBar.png");
  banana = loadImage("img/banana.png");
  banana1 = loadImage("img/banana1.png");
  banana2 = loadImage("img/banana2.png");
  banana3 = loadImage("img/banana3.png");
  door = loadImage("img/door.png");
  bomb = loadImage("img/explosion.png");
  ice = loadImage("img/ice.png");
  blood = loadImage("img/blood.png");
  trap = loadImage("img/trap.png");
  bananaball = loadImage("img/bananaball.png");
  doorball = loadImage("img/doorball.png");
  bombball = loadImage("img/bombball.png");
  iceball = loadImage("img/iceball.png");
  bloodball = loadImage("img/bloodball.png");
  trapball = loadImage("img/trapball.png");  
  
  //soldier
  redSoldierNormal = loadImage("img/redSoldierNormal.png");
  redSoldierMid = loadImage("img/redSoldierMid.png");
  redSoldierHigh = loadImage("img/redSoldierHigh.png");  
  redSoldierFighting = loadImage("img/redSoldierFighting.png");  
  greenSoldierNormal = loadImage("img/greenSoldierNormal.png");  
  greenSoldierMid = loadImage("img/greenSoldierMid.png");  
  greenSoldierHigh = loadImage("img/greenSoldierHigh.png");
  greenSoldierFighting = loadImage("img/greenSoldierFighting.png");
  
  redTower = loadImage("img/redTower.png"); 
  greenTower = loadImage("img/greenTower.png");
  towerHealthBar = loadImage("img/towerHealthBar.png");
  redTowerHealthBarCover = loadImage("img/redTowerHealthBarCover.png");
  greenTowerHealthBarCover = loadImage("img/greenTowerHealthBarCover.png");
 
  lands = new Land [COL_NUM][ROW_NUM];
  for(int col =0;col<COL_NUM;col++){
    for(int row = 0; row<ROW_NUM;row++){
      if(col ==0 || col==1){
        lands[col][row] = new Land(col, row, RED);
        redLandNum = ROW_NUM*2;
      }else if(col == 18 || col == 19){
        lands[col][row] = new Land(col, row, GREEN);
        greenLandNum = ROW_NUM*2;
      }else lands[col][row] = new Land(col, row, OWNERLESS);
    }
  }
  
  bottles = new Bottle[2][MAX_SOLDIER_NUM];
  redItemBar = new Bar(10);
  greenItemBar = new Bar(20);
  
  items = new Item[24];
  for(int i = 0; i <3; i++){
  
  float newX1 = 160+LAND_SIZE * (2+ i * 4 + floor(random(2)));
  float newY1= 220+LAND_SIZE * floor(random(ROW_NUM));
  float newX2 = 160+LAND_SIZE * (2+ i * 4 + floor(random(2,4)));  
  float newY2= 220+LAND_SIZE * floor(random(ROW_NUM));
   for(int w=0; w<2 ;w++){
    for(int s=0; s<MAX_SOLDIER_NUM; s++){
      if(bottles[w][s] != null){
        if(newX1 == bottles[w][s].x && newY1 == bottles[w][s].y) samePlace1 = true ;
        if(newX2 == bottles[w][s].x && newY2 == bottles[w][s].y) samePlace2 = true ;}
        if(samePlace1 == true || samePlace2 == true){i--;}else{
        
        switch(i){
       case 0: int showUp = floor(random(0,2));
          if(showUp == 0){ 
          items[0+(8*round)] = new Bomb(newX1, newY1);
          items[0+(8*round)].itemKind = 4;
          items[1+(8*round)] = new Bomb(newX2, newY2);
          items[1+(8*round)].itemKind = 4;
        }
        if(showUp == 1){ 
          items[0+(8*round)] = new Trap(newX1, newY1);
          items[0+(8*round)].itemKind = 6;
          items[1+(8*round)] = new Trap(newX2, newY2);
          items[1+(8*round)].itemKind = 6;
        }
    
    case 1:showUp = floor(random(0,10));
          if(showUp == 0){ 
          items[2+(8*round)] = new Banana(newX1, newY1);
          items[2+(8*round)].itemKind = 2;
          items[3+(8*round)] = new Banana(newX2, newY2);
          items[3+(8*round)].itemKind = 2;
        }else{ 
          items[2+(8*round)] = new Door(newX1, newY1);
          items[2+(8*round)].itemKind = 3;
          items[3+(8*round)] = new Door(newX2, newY2);
          items[3+(8*round)].itemKind = 3;
        }
    
    case 2: showUp = floor(random(0,10));
          if(showUp == 0){ 
          items[4+(8*round)] = new Ice(newX1, newY1); 
          items[4+(8*round)].itemKind = 5;
          items[5+(8*round)] = new Ice(newX2, newY2);
          items[5+(8*round)].itemKind = 5;
        }else{ 
          items[4+(8*round)] = new Blood(newX1, newY1);
          items[4+(8*round)].itemKind = 1;
          items[5+(8*round)] = new Blood(newX2, newY2);
          items[5+(8*round)].itemKind = 1;
        }
    
    case 3: showUp = floor(random(0,2));
          if(showUp == 0){ 
          items[6+(8*round)] = new Bomb(newX1, newY1); 
          items[6+(8*round)].itemKind = 4;
          items[7+(8*round)] = new Bomb(newX2, newY2);
          items[7+(8*round)].itemKind = 4;
        }
        if(showUp == 1){ 
          items[6+(8*round)] = new Trap(newX1, newY1);
          items[6+(8*round)].itemKind = 6;
          items[7+(8*round)] = new Trap(newX2, newY2);
          items[7+(8*round)].itemKind = 6;
        }
    }
  }
      
    }
    
      }
  }
   
   gameTimer = 2400;
}


void initGame(){
  
}

void draw(){
  switch(gameState){
    
    case GAME_START:
    image(bg, 0, 0, 1920, 1080);
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
      image(bg, 0, 0, 1920, 1080);
      drawGameRound("GAME SET",#000055);
      gameTimer--;
      
      for(int col = 0; col < COL_NUM; col++){
        for(int row = 0; row < ROW_NUM; row++){
          lands[col][row].display();
        }
      }
      
      //itemBar
      image(itemBar,20,900);
      image(itemBar,1300,900);
      redItemBar.display(90);
      greenItemBar.display(1380);
      
      //item display
      for(int i=0; i<items.length; i++){
        if(items[i]!=null)items[i].display();
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
      moveRect();
      
      if (gameTimer ==0){
        gameState = GAME_FIGHT;
        gameTimer = GAMETIME;
      }
      
      break;
    
    case GAME_FIGHT:
      image(bg, 0, 0, 1920, 1080);
      drawGameRound("GAME FIGHT",#000055);
      gameTimer--;
      
      //itemBar
      image(itemBar,20,900);
      image(itemBar,1300,900);
      redItemBar.display(90);
      greenItemBar.display(1380);    
      redItemBar.display(90);
      greenItemBar.display(1380);
      
      //item display
      for(int i=0; i<items.length; i++){
        if(items[i]!=null)items[i].display();
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
      for(int k=0 ; k<items.length ; k++){
        for(int j=0 ; j<MAX_SOLDIER_NUM ; j++){
          if(items[k]!=null && items[k].isAlive){
            if(bottles[0][j]!= null){
              if(items[k].itemState == ITEM_PICK_STATE){
               if(items[k].checkCollision(bottles[0][j])==1){
                 if(items[k].itemKind == 1) redItemBar.barNumber[BLOOD]++ ; 
                 if(items[k].itemKind == 2) redItemBar.barNumber[BANANA]++ ;
                 if(items[k].itemKind == 3) redItemBar.barNumber[DOOR]++ ;
                 if(items[k].itemKind == 4) redItemBar.barNumber[BOMB]++ ;
                 if(items[k].itemKind == 5) redItemBar.barNumber[ICE]++ ;
                 if(items[k].itemKind == 6) redItemBar.barNumber[TRAP]++ ;
               }
               }
             }
         }
       }
     }
     
     for(int k=0 ; k<items.length ; k++){
        for(int j=0 ; j<MAX_SOLDIER_NUM ; j++){
          if(items[k]!=null && items[k].isAlive && bottles[1][j]!= null){
            if(items[k].itemState == ITEM_PICK_STATE){
             if(items[k].checkCollision(bottles[1][j])==1){
               if(items[k].itemKind == 1) greenItemBar.barNumber[BLOOD]++ ; 
               if(items[k].itemKind == 2) greenItemBar.barNumber[BANANA]++ ;
               if(items[k].itemKind == 3) greenItemBar.barNumber[DOOR]++ ;
               if(items[k].itemKind == 4) greenItemBar.barNumber[BOMB]++ ;
               if(items[k].itemKind == 5) greenItemBar.barNumber[ICE]++ ;
               if(items[k].itemKind == 6) greenItemBar.barNumber[TRAP]++ ;
             }
           }
         }
       }
     }
     
      if (gameTimer ==0){
        round++;
        gameState = GAME_SET;
        gameTimer = GAMETIME;
      }
      if ((gameTimer ==0 && round ==2)|| redHP==0 || greenHP ==0){
          gameState = GAME_OVER;
      }
    
      break;
      
    case GAME_OVER:
      image(bg, 0, 0, 1920, 1080);
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
  float totalSeconds = float(frames) / 60;
  result += nf(floor(totalSeconds), 2);
  
  return result;
}

PFont font;
font = createFont("font",100);

void showRound(){
  textFont(font,110);
  textAlign(CENTER);
  String roundString = "ROUND" + round;
  fill(0, 120);  
  text(roundString, width/2, 200);
  fill(#00ffff);
  text(roundString, width/2+10, 210);
}

void timeCountdown(){ 
  textFont(font,110);
  textAlign(CENTER);
  String timeString = convertFrameToTimeString(gameTimer);
  timeString += "TIME" ;
  fill(0, 120);  
  text(timeString, width/2, 100);
  fill(#00ffff);
  text(timeString, width/2+10, 110);
  
  gameTimer --;
}

void moveRect(){
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
      bottles[0][redBottleUsed] = new SmallBottle(RED, redChooseCol, redChooseRow);
      redBottleUsed++;
      redSmallBottleAVL--;
      break;
      case 'x':
      bottles[0][redBottleUsed] = new MiddleBottle(RED, redChooseCol, redChooseRow);
      redBottleUsed++;
      redMiddleBottleAVL--;
      break;
      case 'c':
      bottles[0][redBottleUsed] = new LargeBottle(RED, redChooseCol, redChooseRow);
      redBottleUsed++;
      redLargeBottleAVL--;
      break;
      
      //Put green bottle
      case '1':
      bottles[1][greenBottleUsed] = new SmallBottle(GREEN, greenChooseCol, greenChooseRow);
      greenBottleUsed++;
      greenSmallBottleAVL--;
      break;
      case '2':
      bottles[1][greenBottleUsed] = new MiddleBottle(GREEN, greenChooseCol, greenChooseRow);
      greenBottleUsed++;
      greenMiddleBottleAVL--;
      break;
      case '3':
      bottles[1][greenBottleUsed] = new LargeBottle(GREEN, greenChooseCol, greenChooseRow);
      greenBottleUsed++;
      greenLargeBottleAVL--;
      break;
      }
    } //<>//
    
  /*if(gameState == GAME_FIGHT){
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
       
        
        
      case  'z' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 1 && redItemBar.barNumber[BLOOD]>0){
              items[k].display();
              redItemBar.barNumber[BLOOD]--;
            }
          }
        }
      }
          break ;
      case  'x' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 2 && redItemBar.barNumber[BANANA]>0){
              items[k].display();
              redItemBar.barNumber[BANANA]--;
            }
          }
        }
      }
          break ;
      case  'c' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 3 && redItemBar.barNumber[DOOR]>0){
              items[k].display();
              redItemBar.barNumber[DOOR]--;
            }
          }
        }
      }
          break ;
      case  'v' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 4 && redItemBar.barNumber[BOMB]>0){
              items[k].display();
              redItemBar.barNumber[BOMB]--;
            }
          }
        }
      }
          break ;
      case  'b' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 5 && redItemBar.barNumber[ICE]>0){
              items[k].display();
              redItemBar.barNumber[ICE]--;
            }
          }
        }
      }
          break ;
      case  'n' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 6 && redItemBar.barNumber[TRAP]>0){
              items[k].display();
              redItemBar.barNumber[TRAP]--;
            }
          }
        }
      }
          break ;
      case  '1' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 1 && greenItemBar.barNumber[BLOOD]>0){
              items[k].display();
              greenItemBar.barNumber[BLOOD]--;
            }
          }
        }
      }
          break ;
      case  '2' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 2 && greenItemBar.barNumber[BANANA]>0){
              items[k].display();
              greenItemBar.barNumber[BANANA]--;
            }
          }
        }
      }
          break ;
      case  '3' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 3 && greenItemBar.barNumber[DOOR]>0){
              items[k].display();
              greenItemBar.barNumber[DOOR]--;
            }
          }
        }
      }
          break ;
      case  '4' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 4 && greenItemBar.barNumber[BOMB]>0){
              items[k].display();
              greenItemBar.barNumber[BOMB]--;
            }
          }
        }
      }
          break ;
      case  '5' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 5 && greenItemBar.barNumber[ICE]>0){
              items[k].display();
              greenItemBar.barNumber[ICE]--;
            }
          }
        }
      }
          break ;
      case  '6' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null && items[k].isAlive){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 6 && greenItemBar.barNumber[TRAP]>0){
              items[k].display();
              greenItemBar.barNumber[TRAP]--;
            }
          }
        }
      }
          break ;    

  }*/
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

import ddf.minim.*;
Minim minim;
AudioPlayer song;

PImage round1, round2,round3;

boolean samePlace1,samePlace2;
PImage bg, gamestart, gameover, gameread, gameread2, gameread3;
PImage startNormal, startHovered, restartNormal, restartHovered, skipNormal, skipHovered ;
PImage banana, banana1, banana2, banana3, ice, blood, bomb, door, trap;
PImage explosion;
PImage itemBar, redSoldierBar, greenSoldierBar;
PImage redChoose, greenChoose, redChooseProp, greenChooseProp;
PImage bananaball, iceball, bloodball, bombball, doorball, trapball;

PImage redSoldierNormal, redSoldierMid, redSoldierHigh, redSoldierFighting, redSoldierMidFighting, redSoldierHighFighting;
PImage greenSoldierNormal, greenSoldierMid, greenSoldierHigh, greenSoldierFighting, greenSoldierMidFighting, greenSoldierHighFighting;
PImage redLand, greenLand, ownerlessLand;

PImage redTower, greenTower;
PImage towerHealthBar, redTowerHealthBarCover, greenTowerHealthBarCover;

PImage bolbNormal, kappaNormal, bolbAward, kappaAward;

//gamestate
final int GAME_START = 0, GAME_READ=1, GAME_SET = 2, GAME_FIGHT = 3, GAME_OVER = 4;
int gameState = 0;
int round = 0;
int gameTimer = 0;
final int GAME_PUT_TIME = 200, GAME_TIME = 400;
 
//HP
int HEALTH_POINT = 1000;
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

float redCoverH=0, greenCoverH=0;

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
final int MAX_SOLDIER_NUM = 100;

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
Bar redBottleBar;
Bar greenBottleBar;

PFont font;
int count = 0;

void setup() {
  size(1920,1080);
  frameRate(40);
  
  minim = new Minim(this);
  song = minim.loadFile("song.mp3", 1024);
  song.play();
  song.loop();
  
  bg = loadImage("img/bg.png");
  gamestart = loadImage("img/gamestart.png");
  gameover = loadImage("img/gameover.png");
  gameread = loadImage("img/gameread.png");
  gameread2 = loadImage("img/gameread2.png");
  gameread3 = loadImage("img/gameread3.png");
  startNormal = loadImage("img/startNormal.png");
  startHovered = loadImage("img/startHovered.png");
  restartNormal = loadImage("img/restartNormal.png");
  restartHovered = loadImage("img/restartHovered.png");
  skipNormal = loadImage("img/skipNormal.png");
  skipHovered = loadImage("img/skipHovered.png");
  
  round1 = loadImage("img/round1.png");
round2 = loadImage("img/round2.png");
round3 = loadImage("img/round3.png");
  
  //choose
  redChoose = loadImage("img/redChoose.png");
  greenChoose = loadImage("img/greenChoose.png");
  redChooseProp = loadImage("img/redChooseProp.png");
  greenChooseProp = loadImage("img/greenChooseProp.png");
  
  //item
  itemBar = loadImage("img/itemBar.png");
  redSoldierBar = loadImage("img/redSoldierBar.png");
  greenSoldierBar = loadImage("img/greenSoldierBar.png");
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
  redSoldierMidFighting = loadImage("img/redSoldierMidFighting.png");
  redSoldierHighFighting = loadImage("img/redSoldierHighFighting.png");  
  
  greenSoldierNormal = loadImage("img/greenSoldierNormal.png");  
  greenSoldierMid = loadImage("img/greenSoldierMid.png");  
  greenSoldierHigh = loadImage("img/greenSoldierHigh.png");
  greenSoldierFighting = loadImage("img/greenSoldierFighting.png");
  greenSoldierMidFighting = loadImage("img/greenSoldierMidFighting.png");
  greenSoldierHighFighting = loadImage("img/greenSoldierHighFighting.png");
  
  //Tower
  redTower = loadImage("img/redTower.png"); 
  greenTower = loadImage("img/greenTower.png");
  towerHealthBar = loadImage("img/towerHealthBar.png");
  redTowerHealthBarCover = loadImage("img/redTowerHealthBarCover.png");
  greenTowerHealthBarCover = loadImage("img/greenTowerHealthBarCover.png");
 
  //name
  bolbNormal = loadImage("img/bolbNormal.png"); 
  bolbAward = loadImage("img/bolbAward.png"); 
  kappaNormal = loadImage("img/kappaNormal.png"); 
  kappaAward = loadImage("img/kappaAward.png"); 

  
  
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
  redItemBar = new Bar(6);
  greenItemBar = new Bar(6);
  redBottleBar = new Bar(3);
  greenBottleBar = new Bar(3);
  
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
   
   
   font = createFont("font.ttf",100);
}


void initImage(){
  image(redTower,0,220);
  image(greenTower,1760,220);
  image(towerHealthBar, 20 , 265);
  image(towerHealthBar, width-58 , 265);
  
  //itemBar
  image(itemBar,20,900);
  image(itemBar,1300,900);
  redItemBar.textNumber(20);
  greenItemBar.textNumber(width - 600 - 20);
  redBottleBar.textNumber(630);
  greenBottleBar.textNumber(width - 300 - 630);
  image(redSoldierBar,630,900);
  image(greenSoldierBar,990,900);
  
  image(bolbNormal, 160, 60);
  image(kappaNormal, 1460, 60,300,130);
}

void initGame(){
  redChooseX = 160; redChooseY = 220;
  greenChooseX = 1680; greenChooseY = 220;
  gameTimer = GAME_PUT_TIME;
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
  for(int i=0;i<6;i++){
  redItemBar.barNumber[i]=0;
  greenItemBar.barNumber[i]=0;}

    for(int i = 0; i< 2;i++){
    for(int j = 0; j < MAX_SOLDIER_NUM; j++){
      bottles[i][j] = null;
    }}
  
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
  round = 0;
}

void draw(){
  switch(gameState){
    
    case GAME_START:
   
    image(bg, 0, 0, 1920, 1080);
    
    
    image(gamestart,0,0);

    if(START_BUTTON_X + START_BUTTON_WIDTH > mouseX
      && START_BUTTON_X < mouseX
      && START_BUTTON_Y + START_BUTTON_HEIGHT > mouseY
      && START_BUTTON_Y < mouseY) {

      image(startHovered, START_BUTTON_X, START_BUTTON_Y);
      if(mousePressed){
        gameState = GAME_READ;
        round=0;
        gameTimer = GAME_PUT_TIME*(round+1);
        mousePressed = false;
      }

    }else{

      image(startNormal, START_BUTTON_X, START_BUTTON_Y);

    }
    
    break;
     
     case GAME_READ:
       switch(count){
         case 0:
         image(gameread,0,0);
         break;
         case 1:
         image(gameread2,0,0);
         break;
         case 2:
         image(gameread3,0,0);         
         break;
         case 3:
         gameState = GAME_SET;
       }
        //if(keyPressed) image(gameread,0,0);
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
      image(bg, 0, 0, 1920, 1080);
      gameTimer--;
      
      for(int col = 0; col < COL_NUM; col++){
        for(int row = 0; row < ROW_NUM; row++){
          lands[col][row].display();
        }
      }
      
      initImage();
      
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
      showRound();
      moveRect();
      

      //if(redHP!=HEALTH_POINT){
      //  map(100, 38, 38, 280, 400);
      //  image(redTowerHealthBarCover, 38, 280 , 38 , redCoverH);
      //  redCoverH = HEALTH_POINT-redHP;
      //}
      //if(greenHP!=HEALTH_POINT){
      //  map(100, 38, 38, 280, 400);
      //  image(greenTowerHealthBarCover,width-38, 280 , width-38 , greenCoverH);
      //  greenCoverH = HEALTH_POINT-greenHP;
      //}
      
      if (gameTimer ==0){
        gameState = GAME_FIGHT;
        gameTimer = GAME_TIME;
      }
      
      //      for(int col =0;col<COL_NUM;col++){
      //for(int row = 0; row<ROW_NUM;row++){
      //lands[col][row].hasBottle = false;
      //}
      //}
      //for(int i = 0; i < 2; i++){
      //for(int j = 0; j < MAX_SOLDIER_NUM; j++){
      //for(int k = 0; k < bottles[i][j].rows.length; k++){
      //lands[bottles[i][j].col][bottles[i][j].rows[k]].hasBottle = true;
      //}
      //}
      //}
      
      
      
      break;
    
    case GAME_FIGHT:
      image(bg, 0, 0, 1920, 1080);
      
      gameTimer--;
      timeCountdown();
      showRound();
      initImage();
      
      //item display
      for(int i=0; i<items.length; i++){
        if(items[i]!=null)items[i].display();
      }
      
      for(int col = 0; col < COL_NUM; col++){
        for(int row = 0; row < ROW_NUM; row++){
          lands[col][row].display();
        }
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
      //red pick up item
      for(int k=0 ; k<items.length ; k++){
        for(int j=0 ; j<MAX_SOLDIER_NUM ; j++){
          if(items[k]!=null && items[k].isAlive){
            if(bottles[0][j]!= null){
              if(items[k].itemState == ITEM_PICK_STATE){
               if(items[k].checkCollision(bottles[0][j])==1){ items[k].itemState = ITEM_USE_STATE;
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
     //red use item
     
     for(int k=0 ; k<items.length ; k++){
        for(int j=0 ; j<MAX_SOLDIER_NUM ; j++){
          if(items[k]!=null && items[k].isAlive){
            if(bottles[0][j]!= null){
              if(items[k].itemState == ITEM_USE_STATE){
               if(items[k].checkCollision(bottles[0][j])==1){
                 //if(items[k].itemKind == 1) items[k].collision(bottles[0][j]);
                 //if(items[k].itemKind == 2) items[k].collision(bottles[0][j]); 
                 //if(items[k].itemKind == 3) items[k].collision(bottles[0][j]); 
                 //if(items[k].itemKind == 4) items[k].collision(bottles[0][j]);
                 //if(items[k].itemKind == 5) /*bottles[1][j].freeze();*/
                 /*if(items[k].itemKind == 6)*/ items[k].collision(bottles[0][j]); 
               }
               }
             }
         }
       }
     }
     //green use item
     for(int k=0 ; k<items.length ; k++){
        for(int j=0 ; j<MAX_SOLDIER_NUM ; j++){
          if(items[k]!=null && items[k].isAlive){
            if(bottles[0][j]!= null){
              if(items[k].itemState == ITEM_USE_STATE){
               if(items[k].checkCollision(bottles[1][j])==1){
                 if(items[k].itemKind == 1) items[k].collision(bottles[1][j]);
                 if(items[k].itemKind == 2) items[k].collision(bottles[1][j]);
                 if(items[k].itemKind == 3) items[k].collision(bottles[1][j]);
                 if(items[k].itemKind == 4) items[k].collision(bottles[1][j]);
                 if(items[k].itemKind == 5) /*bottles[1][j].freeze();*/
                 if(items[k].itemKind == 6) items[k].collision(bottles[1][j]);
               }
               }
             }
         }
       }
     }
     //green pick up item
     for(int k=0 ; k<items.length ; k++){
        for(int j=0 ; j<MAX_SOLDIER_NUM ; j++){
          if(items[k]!=null && items[k].isAlive && bottles[1][j]!= null){
            if(items[k].itemState == ITEM_PICK_STATE){
             if(items[k].checkCollision(bottles[1][j])==1){ items[k].itemState = ITEM_USE_STATE;
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
     
 

      moveRect();
     
      if (gameTimer ==0){
        round++;
        gameState = GAME_SET;
        gameTimer = GAME_PUT_TIME*(round+1);
      }
      if ((gameTimer ==0 && round ==2)|| redHP==0 || greenHP ==0){
          gameState = GAME_OVER;
      }
    
      if (round== 3)gameState = GAME_OVER;  //gameover
      if(redHP<=0 || greenHP<=0 ) gameState = GAME_OVER;
      break;
      
    case GAME_OVER:
      image(bg, 0, 0, 1920, 1080);
      String winnerText="WIN";
        image(gameover, 0, 0);
          if(redHP<=0 ||  redLandNum< greenLandNum){
            winnerText = "THE WINNER IS KAPPA!";
            image(kappaAward,340,575, 460, 200);
            image(bolbNormal,1220,600);
          }
          else if(greenHP<=0 || redLandNum> greenLandNum){
            winnerText = "THE WINNER IS BOLB!";
            image(bolbAward,340,575);
            image(kappaNormal,1220,600, 460, 200);
          }
          else if(redLandNum== greenLandNum)winnerText = "EVEN";
          textAlign(CENTER);
          textFont(font,50);
          text(winnerText,width/2,height/2-100);
          
          
          
          
          if(RESTART_BUTTON_X + RESTART_BUTTON_WIDTH > mouseX
            && RESTART_BUTTON_X < mouseX
            && RESTART_BUTTON_Y + RESTART_BUTTON_HEIGHT > mouseY
            && RESTART_BUTTON_Y < mouseY) {
      
            image(restartHovered, RESTART_BUTTON_X, RESTART_BUTTON_Y);
            if(mousePressed){
              gameState = GAME_SET;
              mousePressed = false;
              initGame();
            }
      
          }else{
      
            image(restartNormal, RESTART_BUTTON_X, RESTART_BUTTON_Y);
      
          }
         
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
  result += nf(floor(totalSeconds), 2);
  
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
  if(gameState == GAME_READ) count++;
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
    if(lands[redChooseCol][redChooseRow].hasBottle == false){
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
    } //<>//
    
  if(gameState == GAME_FIGHT){
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
       
        
        
      case  'z' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 1 && redItemBar.barNumber[BLOOD]>0){
              items[k].isAlive = true;
              items[k].display();
              redItemBar.barNumber[BLOOD]--;                
              items[k].x=redChooseX;
              items[k].y=redChooseY;
            }
          }
        }
      }
          break ;
      case  'x' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 2 && redItemBar.barNumber[BANANA]>0){
              items[k].isAlive = true;
              items[k].display();
              redItemBar.barNumber[BANANA]--;                
              items[k].x=redChooseX;
              items[k].y=redChooseY;
            }
          }
        }
      }
          break ;
      case  'c' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 3 && redItemBar.barNumber[DOOR]>0){
              items[k].isAlive = true;
              items[k].display();
              redItemBar.barNumber[DOOR]--;                
              items[k].x=redChooseX;
              items[k].y=redChooseY;
            }
          }
        }
      }
          break ;
      case  'v' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null ){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 4 && redItemBar.barNumber[BOMB]>0){
              items[k].isAlive = true;
              items[k].display();
              redItemBar.barNumber[BOMB]--;                
              items[k].x=redChooseX;
              items[k].y=redChooseY;
            }
          }
        }
      }
          break ;
      case  'b' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 5 && redItemBar.barNumber[ICE]>0){
              
              redItemBar.barNumber[ICE]--;
            }
          }
        }
      }
          break ;
      case  'n' :
        for(int k=0; k<items.length; k++){
          if(items[k]!= null ){
            if(items[k].itemState == ITEM_USE_STATE){
              if(items[k].itemKind == 6 && redItemBar.barNumber[TRAP]>0){
                items[k].isAlive = true;
                items[k].display();
                redItemBar.barNumber[TRAP]--;                
                items[k].x=redChooseX;
                items[k].y=redChooseY;
              }
            }
          }
        }
          break ;
      case  '1' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 1 && greenItemBar.barNumber[BLOOD]>0){
              items[k].isAlive = true;
              items[k].display();
              greenItemBar.barNumber[BLOOD]--;                
              items[k].x=greenChooseX;
              items[k].y=greenChooseY;
            }
          }
        }
      }
          break ;
      case  '2' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 2 && greenItemBar.barNumber[BANANA]>0){
              items[k].isAlive = true;
              items[k].display();
              greenItemBar.barNumber[BANANA]--;                
              items[k].x=greenChooseX;
              items[k].y=greenChooseY;
            }
          }
        }
      }
          break ;
      case  '3' :
       for(int k=0; k<items.length; k++){
        if(items[k]!= null){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 3 && greenItemBar.barNumber[DOOR]>0){
              items[k].isAlive = true;
              items[k].display();
              greenItemBar.barNumber[DOOR]--;                
              items[k].x=greenChooseX;
              items[k].y=greenChooseY;
            }
          }
        }
      }
          break ;
      case  '4' :
      for(int k=0; k<items.length; k++){
        if(items[k]!= null ){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 4 && greenItemBar.barNumber[BOMB]>0){
              items[k].isAlive = true;
              items[k].display();
              greenItemBar.barNumber[BOMB]--;                
              items[k].x=greenChooseX;
              items[k].y=greenChooseY;
            }
          }
        }
      }
          break ;
      case  '5' :
     for(int k=0; k<items.length; k++){
        if(items[k]!= null){
          if(items[k].itemState == ITEM_USE_STATE){
            if(items[k].itemKind == 5 && greenItemBar.barNumber[ICE]>0){
              
              greenItemBar.barNumber[ICE]--;
            }
          }
        }
      }
          break ;
      case  '6' :
      for(int k=0; k<items.length; k++){
          if(items[k]!= null ){
            if(items[k].itemState == ITEM_USE_STATE){
              if(items[k].itemKind == 6 && greenItemBar.barNumber[TRAP]>0){
                items[k].isAlive = true;
                items[k].display();
                greenItemBar.barNumber[TRAP]--;                
                items[k].x=greenChooseX;
                items[k].y=greenChooseY;
              }
            }
          }
        }
          break ;    

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

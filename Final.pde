PImage redSoldier, blueSoldier, item;

final int LAND_SIZE = 80;
final int COL_NUM = 20, ROW_NUM = 8;

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

Land lands [][];
Soldier soldiers [][];

boolean move = false;

void setup(){
  size(1920, 1080);
  
  lands = new Land [COL_NUM][ROW_NUM];
  soldiers = new Soldier [2][MAX_SOLDIER_NUM];
  
  redSoldier = loadImage("img/red_soldier.jpg");
  blueSoldier = loadImage("img/blue_soldier.jpg");
  item = loadImage("img/item.jpg");

  frameRate(40);
}

void draw(){
  //land
  background(255);
  strokeWeight(5);
  for(int i = 0; i < 21; i++){
    line(160 + i * 80, 220, 160 + i * 80, 860);
  }
  for(int i = 0; i < 9; i++){
    line(160, 220 + i * 80, 1760, 220 + i * 80);
  }
  
  //bg
  //image(bg, 0, 0, width, height);
  
  //soldier
  for(int i = 0; i < 2; i++){
    for(int j = 0; j < MAX_SOLDIER_NUM; j++){
      if(soldiers[i][j] != null && soldiers[i][j].isAlive == true){
        soldiers[i][j].display();
        if(move) {soldiers[i][j].move();
        }
      }
    }
  }  
}

void keyPressed(){
  switch(key){
    case 'r':
    soldiers[0][redLowSoldierUsed] = new Soldier(RED, 0, redLowSoldierUsed);
    soldiers[0][redLowSoldierUsed].img = redSoldier;
    redLowSoldierUsed++;
    redLowSoldierAVL--;
    break;
    case 'b':
    soldiers[1][blueLowSoldierUsed] = new Soldier(BLUE, 19, blueLowSoldierUsed);
    soldiers[1][blueLowSoldierUsed].img = blueSoldier;
    blueLowSoldierUsed++;
    blueLowSoldierAVL--;
    break;
    case 'm':
    move = true;
    break;
  }
}

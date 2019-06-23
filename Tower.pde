class Tower{
  int x, y, camp, health;
  boolean isAlive = true;
  PImage towerImg, barImg, coverImg;
  
  Tower(int camp, int x, int y){
    this.camp = camp;
    this.x = x;
    this.y = y;
    health = HEALTH_POINT;
    isAlive = true;
    barImg = loadImage("img/scene/towerHealthBar.png");
    towerImg = (camp == RED) ? loadImage("img/scene/redTower.png") : loadImage("img/scene/greenTower.png");
    coverImg = (camp == RED) ? loadImage("img/scene/redTowerHealthBarCover.png") : loadImage("img/scene/greenTowerHealthBarCover.png");
  }
  
  void display(){
    image(towerImg, x, y);
    image(barImg, (camp == RED) ? 20 : width - 50, y + 45);
  }
  
  void damage(){
    float greenDamageHealth = map(HEALTH_POINT - greenTowerHP, 0, 1000, 0, 420);
    float redDamageHealth = map(HEALTH_POINT-redTowerHP, 0, 1000, 0, 420);
    if(camp == RED) image(coverImg, 18, 260 , 38 ,redDamageHealth);
    else image(coverImg, width - 58, y + 40 , 38 , greenDamageHealth);
    
    
  }  
}

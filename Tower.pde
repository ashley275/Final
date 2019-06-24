class Tower{
  boolean isAlive = true;
  PImage redTower, greenTower, barImg, coverRedImg, coverGreenImg;
  
  Tower(){
    isAlive = true;
    barImg = loadImage("img/scene/towerHealthBar.png");
    redTower = loadImage("img/scene/redTower.png");
    greenTower = loadImage("img/scene/greenTower.png");
    coverRedImg = loadImage("img/scene/redTowerHealthBarCover.png");
    coverGreenImg = loadImage("img/scene/greenTowerHealthBarCover.png");
  }
  
  void display(){
    image(redTower, 0, 220);
    image(greenTower, width-160, 220);
    image(barImg, 20 , 265);
    image(barImg, width-50, 265);
    float greenDamageHealth = map(HEALTH_POINT - greenTowerHP, 0, 1000, 0, 420);
    float redDamageHealth = map(HEALTH_POINT-redTowerHP, 0, 1000, 0, 420);
    image(coverRedImg, 18, 260 , 38 ,redDamageHealth);
    image(coverGreenImg, width - 52, 260 , 38 , greenDamageHealth);
  }
  
  void damage(){
    towerDamage.play();

    }
}

class Tower{
  final int redTowerX = 0, redY = 220;
  final int greenTowerX = width-160, greenY = 220;
  boolean isAlive = true;
  float greenTowerHealth,redTowerHealth;
  
  
  Tower(){
    isAlive = true;
  }
  
  void display(){
    if(isAlive == true){
      image(greenTower , width-160 , 220);
      image(redTower , 0 , 220);
      image(towerHealthBar , 20 , 265);
      image(towerHealthBar , width-50 , 265);
    }
  }
  
  void damage(){
    float greenDamageHealth = map(HEALTH_POINT-greenTowerHP, 0, 1000, 0, 420);
    image(greenTowerHealthBarCover, width - 58, 260 , 38 , greenDamageHealth);
    float redDamageHealth = map(HEALTH_POINT-redTowerHP, 0, 1000, 0, 420);
    image(redTowerHealthBarCover,18, 260 , 38 ,redDamageHealth);
  }
  
  
}

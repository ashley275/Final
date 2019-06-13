class LargeBottle extends Bottle{ 
  LargeBottle(int camp, int col, int row){
    super(camp, col, row);
    water = 100;
    damage = 3;
    idleTime = 3;
    for(int i = 0; i < rows.length; i++){
      rows[i] = row + i;
    }
  }
  
  void display(){
    image(img, x, y);
    image(img, x, y + LAND_SIZE);
    image(img, x, y + LAND_SIZE * 2);
  }
}
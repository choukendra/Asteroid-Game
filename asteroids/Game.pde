void game() {
  background(0);
  myShip.show();
  myShip.act();

  fill(255);
  textSize(20);
  text("LIVES: " + myShip.lives, width - 100, 30);
  text("POINTS: " + points, width - 100, 60);
  text("HIGH SCORE: " + hs, width - 100, 90);
  int i = 0;
  while (i < myGameObjects.size()) {
    GameObject myObj = myGameObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives <= 0) {
      myGameObjects.remove(i);
    } else {
      i++;
    }
  }
  if (myShip.lives<=0) {
    mode = gameover;
  }
  
}

class Bullet extends GameObject {
  int timer;
  Bullet() {
    location = new PVector (myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(5);
    lives = 1;
    timer = 60;
    size = 10;
    //location.x = myShip.location.x;
    //location.y = myShip.location.y;
    //velocity.x = myShip.direction.x;
    //velocity.y = myShip.direction.y;
  }

  void show() {
    noStroke();
    fill(#50CEDB );
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();
    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof UBullet) {
        if (dist(myObj.location.x, myObj.location.y, this.location.x, this.location.y) < this.size/2 + myObj.size/2) {
          this.lives--;
          myObj.lives--;
          points++;
        }
      }
    }
    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
}

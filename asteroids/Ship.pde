class Ship extends GameObject {

  //1. Instance Variables
  PVector direction;
  int shotTimer;
  int threshold;
  int t;

  //2. Constructor(s)
  Ship() {
    lives = 3;
    shotTimer = 0;
    threshold = 30;
    size = 60;
    t = 0;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image(shipimg, 0, 0);
    popMatrix();
  }

  void act() {
    super.act();
    println(" "+lives);
    shotTimer++;
    t++;
    if (t > 45) {
      t = 0;
      for (int i = 0; i < myGameObjects.size(); i++) {
        GameObject myObj = myGameObjects.get(i);
        if (myObj instanceof Asteroid) {
          if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
            lives--;
          }
        }
      }

      for (int i = 0; i < myGameObjects.size(); i++) {
        GameObject myObj = myGameObjects.get(i);
        if (myObj instanceof Ufo) {
          if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
            lives--;
          }
        }
      }
    }
    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof UBullet) {
        if (dist(myObj.location.x, myObj.location.y, this.location.x, this.location.y) < this.size/2 + myObj.size/2) {
          this.lives--;
          myObj.lives--;
        }
      }
    }
    if (upkey) velocity.add(direction);
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(-radians(2));
    if (rightkey) direction.rotate(radians(2));
    if (spacekey && shotTimer >= threshold) {
      myGameObjects.add(new Bullet());
      shotTimer = 0;
    }
  }
}

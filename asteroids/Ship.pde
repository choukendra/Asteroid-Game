class Ship extends GameObject {

  //1. Instance Variables
  PVector direction;
  int shotTimer;
  int threshold;
  int t, w;
  int respawn;

  //2. Constructor(s)
  Ship() {
    lives = 5;
    shotTimer = 0;
    threshold = 30;
    size = 60;

    t = 0;
    respawn = 0;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    if (respawn != 0) {
      tint (80, 206, 219, 178);
    } else {
      noTint();
    }

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
            respawn = 1;
          }
        }
      }

      for (int i = 0; i < myGameObjects.size(); i++) {
        GameObject myObj = myGameObjects.get(i);
        if (myObj instanceof Ufo) {
          if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
            lives--;
            respawn = 1;
          }
        }
      }
    }
    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof UBullet) {
        if (dist(myObj.location.x, myObj.location.y, this.location.x, this.location.y) < this.size/2 + myObj.size/2) {
          this.lives--;
          respawn = 1;
          w = 0;
          myObj.lives--;
        }
      }
    }
    if (upkey) velocity.add(direction);
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(-radians(2));
    if (rightkey) direction.rotate(radians(2));
    if (spacekey && shotTimer >= threshold) {
      fire.play();
      fire.rewind();
      myGameObjects.add(new Bullet());
      shotTimer = 0;
    }

    if (respawn != 0) {
      w++;
      noFill();
      stroke(255);
      strokeWeight(5);
      arc(location.x, location.y, 70, 70, -PI/2, (-2*PI) + (0.065*w));

      if (w <= 180 && w >= 60) {
        size = -100;
        shotTimer = 0;
      } else if ( w <= 60) {
        location.x = width/2;
        location.y = height/2;
        velocity = new PVector(0, 0);
        direction = new PVector(0, -0.1);
        size = -100;
        shotTimer = 0;
      } else {
        respawn = 0;
        size = 60;
        w = 0;
        noStroke();
      }
    }
  }
}

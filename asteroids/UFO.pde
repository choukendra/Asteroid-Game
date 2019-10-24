class Ufo extends GameObject {

  //1. Instance Variables
  PVector direction;
  int t;
  int r;
  float temp_radians;

  //2. Constructor(s)
  Ufo() {
    lives = 1;
    t = 0;
    size = 60;
    r = int(random(0, 3));
    location = new PVector (r, r);
    if (r == 0) {
      location.x = -60;
      location.y = int(random(height));
    } else if (r == 1) {
      location.x = width + 60;
      location.y = int(random(height));
    } else if (r == 2) {
      location.y = -60;
      location.x = int(random(width));
    } else if (r == 3) {
      location.y = height + 60;
      location.x = int(random(width));
    }

    //direction = new PVector(myShip.location.x-location.x, myShip.location.y-location.y);
    direction = new PVector(0, -0.1);
    velocity = new PVector(0, 1);
    velocity.setMag(random(1, 3));
    velocity.rotate(random(TWO_PI));

    temp_radians = 0;
    //PVector.angleBetween(myShip.location, location);
    //direction.rotate(temp_radians);
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    //direction.x = myShip.location.x;
    //direction.y = myShip.location.y;

    //print(location);
    //print(myShip.location);
    //print(degrees(PVector.angleBetween(myShip.location, location)));
    //direction.rotate(PVector.angleBetween(myShip.location, location) - temp_radians);
    //temp_radians = PVector.angleBetween(myShip.location, location);

    translate(location.x, location.y);
    rotate(direction.heading());
    image(ufoimg, 0, 0);
    popMatrix();
  }

  void act() {
    location.add(velocity);
    if (location.y < -60 || location.y > height + 60 || location.x < -60 || location.x > width + 60) {
      r = int(random(0, 3));
      location = new PVector (r, r);
      if (r == 0) {
        location.x = -60;
        location.y = int(random(height));
      } else if (r == 1) {
        location.x = width + 60;
        location.y = int(random(height));
      } else if (r == 2) {
        location.y = -60;
        location.x = int(random(width));
      } else if (r == 3) {
        location.y = height + 60;
        location.x = int(random(width));
      }
    }

    t++;
    if (t >= 180) { 
      myGameObjects.add(new UBullet(location.x, location.y));
      t = 0;
    }
    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          lives--;
          myObj.lives--;
          points = points + 50;
          myGameObjects.add(new Ufo());
        }
      }
    }
  }
}

class Asteroid extends GameObject {

  Asteroid() {
    lives = 1;
    size = 100;
    location = new PVector(random(width), random(height)); 
    //    velocity = new PVector(random(-1, 1), random(-5, 5));
    velocity = new PVector(0, 1);
    velocity.setMag(random(0, 2));
    velocity.rotate(random(TWO_PI));
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    size = s;
    location = new PVector(x, y); 
    velocity = new PVector(0, 1);
    velocity.setMag(random(0, 2));
    velocity.rotate(random(TWO_PI));
  }

  void show() {
    noStroke();
    fill(150);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();

    for (int i = 0; i < myGameObjects.size(); i++) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          lives = 0;
          myObj.lives = 0;
          points++;

//          myGameObjects.add(new Particle());
//          myGameObjects.add(new Particle());
//          myGameObjects.add(new Particle());
          //int p = 0;
          //while (p < 50) {
          //  myGameObjects.add(new Particle());
          //  GameObject myP = myGameObjects.get(p);
          //  myP.show();
          //  myP.act();
          //}
          //}
          //          //for (int p = 0; p < myGameObjects.size(); p++) {
          //  GameObject myP = myGameObjects.get(p);
          //  if (myP instanceof Particle) {
          //    p = 50;
          //    myP.show();
          //    myP.act();
          //  } else {
          //  //  myP.lives = 0;
          //  }
          //}

          if (size > 10) {
            myGameObjects.add(new Asteroid(size/2, location.x, location.y));
            myGameObjects.add(new Asteroid(size/2, location.x, location.y));
          }
        }
      }


      if (size < 10 && lives == 0) points = points + 10;
    }
  }
}

//class Particle extends GameObject {
//  int timer;
//  PVector direction;
//  Particle () {
//    location = new PVector (location.x, location.y);
//    velocity = new PVector (myShip.direction.x, myShip.direction.y);
//    velocity.setMag(5);
//    lives = 1;
//    timer = 30;
//    size = 3;
//  }
//  void show() {
//    noStroke();
//    ellipse(location.x, location.y, size, size);
//  }
//  void act() {
//    super.act();
//    timer--;
//    if (timer == 0) {
//      lives = 0;
//    }
//  }
//}

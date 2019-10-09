class Bullet extends GameObject {

  Bullet() {
    location = new PVector (myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(5);
    //location.x = myShip.location.x;
    //location.y = myShip.location.y;
    //velocity.x = myShip.direction.x;
    //velocity.y = myShip.direction.y;
  }

  void show() {
    noStroke();
    fill(255, 0, 0);
    ellipse(location.x, location.y, 15, 15);
  }

  void act() {
    location.add(velocity);
  }
}

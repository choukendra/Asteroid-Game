class Ship extends GameObject {
  //1. Instance Variables


  PVector direction;

  //2. Constructor(s)

  Ship() {
    lives = 3;
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
   
    if (upkey) velocity.add(direction);
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(-radians(2));
    if (rightkey) direction.rotate(radians(2));
    if (spacekey) myGameObjects.add(new Bullet());


  }
}

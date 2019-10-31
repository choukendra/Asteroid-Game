class Particle extends GameObject {
  int timer;
  PVector direction;
  Particle (float _locationx, float _locationy) {
    location = new PVector (_locationx, _locationy);
    velocity = new PVector (random(0, width), random(0, height));
    velocity.setMag (random(0.3, 1.7));
    lives = 1;
    timer = 135;
    size = 2;
  }
  void show() {
    noStroke();
    fill (#B9BCA9);
    ellipse(location.x, location.y, size, size);
  }
  void act() {
    super.act();
    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
}

//represents a category
abstract class GameObject {

  int lives;
  int size;
  PVector location;
  PVector velocity;


  GameObject() {
  }

  void show() {
  }

  void act() {
    location.add(velocity); //like x = x + vx and y = y + vy
    if (location.y < -60) location.y = height + 60;
    if (location.y > height + 60) location.y = -60; 
    if (location.x < -60) location.x = width + 60;
    if (location.x > width + 60) location.x = -60;
  }
}

//represents a category
abstract class GameObject {

  int lives;
  PVector location;
  PVector velocity;
  boolean alive;

  GameObject() {
    lives = 1;
  }

  void show() {
  }

  void act() {
    if (location.y < -objectSize) location.y = height + objectSize;
    if (location.y > height + objectSize) location.y = -objectSize; 
    if (location.x < -objectSize) location.x = height + objectSize;
    if (location.x > width + objectSize) location.x = -objectSize;

    location.add(velocity); //like x = x + vx and y = y + vy
  }

  //boolean alive() {
  //  return true;
  //}
}

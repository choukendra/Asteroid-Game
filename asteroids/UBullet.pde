class UBullet extends GameObject {
  int timer;
  int t;
  PVector gravity;
  UBullet (float _locationx, float _locationy) {
    location = new PVector (_locationx, _locationy);
    velocity = new PVector (myShip.location.x - location.x, myShip.location.y - location.y);
    //velocity = new PVector (width/2- location.x, height/2- location.y);
    velocity.setMag(5);
    lives = 1;
    timer = 90;
    size = 10;
    t = 0;
  }

  UBullet(int s, float x, float y) {
    lives = 1;
    size = s;
    location = new PVector(x, y); 
    velocity = new PVector(0, 1);
    velocity.setMag(random(0, 2));
    velocity.rotate(random(TWO_PI));
  }

  void show() {
    noStroke();
    fill(255, 0, 0);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();
    //myUfo.direction.x = myShip.location.x;
    //myUfo.direction.y = myShip.location.y;

    //t++;
    //    if (t == 10 && myUfo.direction.x != myShip.direction.x && myUfo.direction.y != myShip.direction.y) {
    //      myUfo.direction.rotate(myShip.location.x);
    //      myUfo.direction.rotate(myShip.location.y);
    //      t = 0;
    //    }



    timer--;
    if (timer == 0) {
      timer = 90;
      lives = 0;
    }else{
 
      
    }



  }
}

void intro() {
  background(0);
  textSize(60);
  fill(255);
  text("ASTEROID", width/2, height/2);

  myShip = new Ship(); //instantiation --> to make
  //myUfo = new Ufo();
  myGameObjects = new ArrayList<GameObject>();
  myGameObjects.add( new Asteroid()); 
  myGameObjects.add( new Asteroid());
  myGameObjects.add( new Asteroid());
  myGameObjects.add( new Ufo());
  
  points = 0;
  myShip.lives = 5;
  myShip.shotTimer = 0;
  myShip.threshold = 30;
  myShip.size = 60;
  myShip.location = new PVector(width/2, height/2);
  myShip.velocity = new PVector(0, 0);
  myShip.direction = new PVector(0, -0.1);
}

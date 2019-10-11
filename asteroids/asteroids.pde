boolean upkey, downkey, leftkey, rightkey, spacekey;
PImage shipimg;
Ship myShip;
ArrayList<GameObject> myGameObjects; //GameObject = class myGameObjects = Arraylist


void setup() {
  size (800, 600);
  shipimg = loadImage("fighter.png");
  shipimg.resize(60, 60);
  imageMode(CENTER);
  myShip = new Ship(); //instantiation --> to make
  myGameObjects = new ArrayList<GameObject>();
  myGameObjects.add(myShip);
  myGameObjects.add( new Asteroid() );
  myGameObjects.add( new Asteroid() );
  myGameObjects.add( new Asteroid() );
}

void draw() {
  background(0);
  //myShip.show();
  //myShip.act();

  int i = 0;
  while (i < myGameObjects.size()) {
    GameObject currentObject = myGameObjects.get(i); 
    currentObject.show();
    currentObject.act();
    //if (currentObject.alive() == false){
    //  myGameObjects.remove(i);
    //  i--;
    //}
    i++;
  }
}

void keyPressed() {
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key ==' ') spacekey = true;
}

void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false; 
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key ==' ') spacekey = false;
}

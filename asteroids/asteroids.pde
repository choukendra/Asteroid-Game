boolean upkey, downkey, leftkey, rightkey, spacekey;
PFont font;
PImage ufoimg;
PImage shipimg;
PImage particle;
Ship myShip;
//Ufo myUfo;
ArrayList<GameObject> myGameObjects; //GameObject = class myGameObjects = Arraylist
 
int mode, points, hs;
final int intro = 0;
final int game = 1;
final int gameover = 2;

void setup() {
  //println("hello world");
  size (800, 600, P2D);
  hs = 0;
  font = createFont ("Pixellari.ttf", 100);
  textFont(font);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  particle = loadImage("particle.png");
  
  ufoimg = loadImage("alien.png");
  ufoimg.resize(60, 60);
//  myUfo = new Ufo();
  
  shipimg = loadImage("fighter.png");
  shipimg.resize(60, 60);
  myShip = new Ship(); //instantiation --> to make
  
  myGameObjects = new ArrayList<GameObject>();
  //myGameObjects.add(myShip);
  myGameObjects.add( new Asteroid()); // <--default constructor if don't set perameter
  myGameObjects.add( new Asteroid());
  myGameObjects.add( new Asteroid());
}

void draw() {
  //println("hello again");
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else {
    println("Mode error Mode was " + mode);
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

void mouseReleased() {
  if (mode == intro) {
    mode = game;
  } else if (mode == gameover) {
    mode = intro;
  }
}

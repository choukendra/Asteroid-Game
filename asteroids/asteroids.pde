import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer fire;
AudioPlayer ufost;
AudioPlayer bang;

boolean upkey, downkey, leftkey, rightkey, spacekey;
PFont font;
PImage ufoimg;
PImage shipimg;
Ship myShip;
ArrayList<GameObject> myGameObjects; //GameObject = class myGameObjects = Arraylist

int mode, points, hs;
final int intro = 0;
final int game = 1;
final int gameover = 2;
final int win = 3;

void setup() {
  //println("hello world");
  size (800, 600, P2D);
  hs = 0;
  font = createFont ("Pixellari.ttf", 100);
  textFont(font);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);

  ufoimg = loadImage("alien.png");
  ufoimg.resize(60, 60);

  shipimg = loadImage("fighter.png");
  shipimg.resize(60, 60);
  myShip = new Ship(); //instantiation --> to make

  myGameObjects = new ArrayList<GameObject>();
  myGameObjects.add( new Asteroid()); // <--default constructor if don't set perameter
  myGameObjects.add( new Asteroid());
  myGameObjects.add( new Asteroid());

  myGameObjects.add( new Ufo());

  minim = new Minim(this);
  fire = minim.loadFile("fire.wav");
  bang = minim.loadFile("bang.wav");
}

void draw() {
  //println("hello again");
  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else if (mode == win){
   win(); 
  }else {
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
  }else if (mode == win) {
    mode = intro;
  }
}

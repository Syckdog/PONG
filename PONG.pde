import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

final int intro        = 1;
final int play         = 2;
final int pause        = 3;
final int gameover     = 4;
final int AIplay       = 5;
final int menu         = 6;
final int difficulty   = 7;
int previousmode;
int difficult;
int mode = intro;
float xL, yL, xR, yR;
float paddleW, paddleH, paddleS;
float x, y, vx, vy;
boolean upkey, downkey;
boolean w, s;
color colorL = color(255, 0, 0);
color colorR = color(255);
String winner;
color winnercolor;
int pointsR = 0;
int pointsL = 0; 
int winScore = 3;
int timer = 60;
int w1,w2,h1,h2;

Minim minim;
AudioPlayer introsong;
AudioOutput hit;
Sampler sample;

PImage mute;
PImage unmute;
PImage introbutton;
PImage boost;

ArrayList<Star> starList;


void setup() {
  size (800, 600);
  x = width/2;
  y = height/2;
  xL = 10;
  yL = height/2;
  xR = width-10;
  yR = height/2;
  paddleH = 100;
  paddleS = 5;

  vx = 4;
  vy = 4;

  minim = new Minim(this);
  introsong = minim.loadFile("PONG.mp3");
  introsong.loop();
  hit = minim.getLineOut();
  sample = new Sampler("HIT.mp3", 1, minim);
  sample.patch(hit);


  mute = loadImage("mute.png");
  mute.resize(40, 40);
  unmute = loadImage("unmute.png");
  unmute.resize(40, 40);
  introbutton = mute;
  boost = loadImage("boost.png");
  boost.resize(70, 70);
  
  w1 = width/2 - 30;
  w2 = width/2 - 30;
  h1 = height/4;
  h2 = height*3/4;
  
  starList = new ArrayList<Star>();
  int i = 0;
  while (i < 200) {
    starList.add(new Star());
    i = i + 1;
  }
}

void draw() {
  if (mode==intro) {
    intro();
  } else if (mode==play) {
    play();
  } else if (mode==pause) {
    pause();
  } else if (mode==gameover) {
    gameover(winner, winnercolor);
  } else if (mode==AIplay) {
    AIplay();
  } else if (mode==menu) {
    menu();
  } else if (mode==difficulty) {
    difficulty();
  } else {
  }
}

void mouseReleased() {
  if (mode==intro) {
    introClicks();
  } else if (mode==play) {
    playClicks();
  } else if (mode==pause) {
    pauseClicks();
  } else if (mode==gameover) {
    gameoverClicks();
  } else if (mode==AIplay) {
    AIplayClicks();
  } else if (mode==menu) {
    menuClicks();
  } else if (mode==difficulty) {
    difficultyClicks();
  } else {
  }
}

void keyPressed() {
  if (keyCode==UP)    upkey = true;  
  if (keyCode==DOWN)  downkey = true; 
  if (key == 'w') w = true;
  if (key == 's') s = true;
}

void keyReleased() {
  if (keyCode==UP)    upkey = false;
  if (keyCode==DOWN)  downkey = false;
  if (key == 'w') w = false;
  if (key == 's') s = false;

  if (mode==intro) {
    if (key == ' ') {
      mode = menu;
    }
  } else if (mode==pause) {
    if (key == ' ') {
      if (previousmode==play) {
        mode = play;
      } else if (previousmode==AIplay) {
        mode = AIplay;
      }
    }
  }
}

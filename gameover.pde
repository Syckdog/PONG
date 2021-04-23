void gameover(String text, color c) {
  background(0, 0, 255);
  vx = 0;
  vy = 0;
  fill (0);
  textAlign(CENTER, CENTER);
  text ("Game Over", width/2, height/2-40);
  text ("Click to play again", width/2, height/2+40);
  fill (c);
  text(text,width/2,height/2);
}

void gameoverClicks() {
    mode = menu;
    pointsR = 0;
    pointsL = 0;
    vx = 4;
    vy = 4;
}

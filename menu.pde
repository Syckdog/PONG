void menu() {
  background(0, 0, 255);
  fill (0);
  rect (220, 200, 360, 50);
  rect (220, 280, 360, 50);
  fill (255);
  textAlign(CENTER, CENTER);
  textSize(50);
  text ("SINGPLAYER", width/2, height/2 - 80);
  text ("MULTIPLAYER", width/2, height/2);

  fill(255);
  stroke(0);
  ellipse (35, 565, 50, 50);
  image(introbutton, 15, 545);
}

void menuClicks() {
  if (mouseX > 220 && mouseX < 580 && mouseY > 220 && mouseY < 270) {
    mode = difficulty;
    previousmode = AIplay;
  }

  if (mouseX > 220 && mouseX < 580 && mouseY > 280 && mouseY < 330) {
    mode = play;
    previousmode = play;
  }
  

  if (dist(35, 565, mouseX, mouseY) < 25) {
    if (introsong.isPlaying()) {
      introbutton = unmute;
      introsong.pause();
    } else {
      introbutton = mute;
      introsong.loop();
    }
  }
}

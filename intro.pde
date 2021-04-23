void intro() {
  background (0, 0, 255);
  textSize(100);
  text("PONG", 220, 300);
  textSize(30);
  text("FREE TO PLAY", 320, 330);
  text("Press SPACEBAR to start", 230, 500);

  fill(255);
  stroke(0);
  ellipse (35, 565, 50, 50);
  image(introbutton, 15, 545);

  int i = 0;
  while (i < 200) {
    Star myStar = starList.get(i);
    myStar.show();
    myStar.act();
    i = i + 1;
  }
}

void introClicks() {
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

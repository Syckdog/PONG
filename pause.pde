void pause() {
  background(0);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("PAUSED", width/2, height/2);
  textSize(50);
  text("Press SPACEBAR to continue", width/2, height/2+70);

  fill(255);
  stroke(0);
  ellipse (35, 565, 50, 50);
  image(introbutton, 15, 545);
}

void pauseClicks() {
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

void difficulty() {
  background(0, 0, 255);
  fill (0);
  rect (220, 200, 360, 50);
  rect (220, 280, 360, 50);
  rect (220, 360, 360, 50);
  fill (255);
  textAlign(CENTER, CENTER);
  textSize(50);
  text ("CLASSIC", width/2, height/2 - 80);
  text ("BLITZ", width/2, height/2);
  text ("IMPOSSIBLE", width/2, height/2 + 80);
}

void difficultyClicks() {
  if (mouseX > 220 && mouseX < 580 && mouseY > 220 && mouseY < 270) {
    mode = AIplay;
    difficult = 1;
  }

  if (mouseX > 220 && mouseX < 580 && mouseY > 280 && mouseY < 330) {
    mode = AIplay;
    difficult = 2;
  }

  if (mouseX > 220 && mouseX < 580 && mouseY > 360 && mouseY < 410) {
    mode = AIplay;
    difficult = 3;
  }
}

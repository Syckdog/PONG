void play() {
  timer = timer - 1;

  background(0, 0, 255);
  strokeWeight(5);
  line (400, 0, 400, 600);
  noStroke();
  fill (0);
  ellipse (x, y, 50, 50);
  fill (255);
  ellipse (xR, yR, 200, 200);
  fill (255, 0, 0);
  ellipse (xL, yL, 200, 200);

  if (timer < 0) {
    x = x + vx;
    y = y + vy;
  }

  if ( x <= 25) {
    pointsR = pointsR + 1;
    x = width/2;
    y = height/2;
    vx = -4;
    vy = 4;
    timer = 60;
  }

  if (  x >= width - 25) {
    pointsL = pointsL + 1;
    x = width/2;
    y = height/2;
    vx = 4;
    vy = 4;
    timer = 60;
  }

  if ( y <= 25 || y >= height - 25) {
    vy = vy * -1;
    sample.trigger();
  }
  
  if (y > height - 25) {
    y = height-25;
  }
  
  if (y < 25) {
    y = 25;
  }

  if (dist(x, y, xL, yL) < 125) {
    vx = (x-xL)*0.08;
    vy = (y-yL)*0.08;
    sample.trigger();
  }

  if (dist(x, y, xR, yR) < 125) {
    vx = (x-xR)*0.08;
    vy = (y-yR)*0.08;
    sample.trigger();
  }


  if (w == true) {
    yL = yL - 5;
  }

  if (s == true) {
    yL = yL + 5;
  }

  if (upkey == true) {
    yR = yR - 5;
  }

  if (downkey == true) {
    yR = yR + 5;
  }
  
  if (yL - paddleH/2 < 0) {
    yL = yL + paddleS;
  }
  if (yL + paddleH/2 > height) {
    yL = yL - paddleS;
  }
  if (yR - paddleH/2 < 0) {
    yR = yR + paddleS;
  }
  if (yR + paddleH/2 > height) {
    yR = yR - paddleS;
  }

  if (pointsL == winScore) {
    winner = "Red wins!";
    winnercolor = colorL;
    mode = gameover;
  }
  if (pointsR == winScore) {
    winner = "White wins!";
    winnercolor = colorR;
    mode = gameover;
  }

  fill(255);
  ellipse (765, 565, 50, 50);
  stroke(0);
  line (755, 555, 755, 575);
  line (775, 555, 775, 575);

  textSize(50);
  text(pointsL, width/2 - 20, 40);
  text(pointsR, width/2 + 20, 40);
}


void playClicks() {
  if (dist(765, 565, mouseX, mouseY) < 25) {
    mode = pause;
  }
}

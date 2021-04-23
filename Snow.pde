class Star {

  float x, y, vx, vy;
  float size;
  PImage snowflake;

  Star() {
    x = random(0, width);
    y = random(0, height);
    vy = random(1, 5);
    vx = random(1, 5);
    size = random(5, 25);
    snowflake = loadImage("snowflake.png");
  }

  void show() {
    fill(255);
    image(snowflake, x, y, size, size);
  }

  void act() {
    if (size > 15) {
      y = y + vy*1.5;
      x = x + vx*1.5;
    } else {
      y = y + vy;
      x = x + vx;
    }

    if (y > (height - size/2)) y = 0;
    if (x > (width - size/2) || x < 0) vx = -vx;
    
    
  
  }
}

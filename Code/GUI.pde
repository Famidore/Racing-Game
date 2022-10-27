class GUI {
  int x, y, size, sw, rUp, rDown, rLeft, rRight;
  GUI(int tempX, int tempY) {
    x = tempX;
    y = tempY;
    size = 25;
    sw = 2;
    rUp = 0;
    rDown = 0;
    rLeft = 0;
    rRight = 0;
  }


  void display() {
    noFill();
    stroke(0);
    strokeWeight(sw);
    rectMode(CENTER);
    fill(rUp, 0, 0, 150);
    rect(x, y - size/2 - sw, size * 1.5, size, 25);  //up
    fill(rDown, 0, 0, 150);
    rect(x, y + size/2 + sw, size * 1.5, size, 25);  //duwn
    fill(rLeft, 0, 0, 150);
    rect(x - size * 1.5 - sw, y + size/2 + sw, size * 1.5, size, 25);  //left
    fill(rRight, 0, 0, 150);
    rect(x + size * 1.5 + sw, y + size/2 + sw, size * 1.5, size, 25);  //right

    simulate();
    textSize(64);
    textAlign(CENTER, DOWN);
    fill(0, 100);
    text("Velocity: " + int(abs(car.velX) * 10 + abs(car.velY) * 10), width/2, y + size * 2 + 64);
  }

  void simulate() {
    if (controls[0] == 1) {
      rUp = 255;
    } else {
      rUp = 0;
    }
    if (controls[1] == 1) {
      rDown = 255;
    } else {
      rDown = 0;
    }
    if (controls[2] == 1) {
      rRight = 255;
    } else {
      rRight = 0;
    }
    if (controls[3] == 1) {
      rLeft = 255;
    } else {
      rLeft = 0;
    }
  }
}

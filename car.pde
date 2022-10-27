class Car {

  PImage img;
  float accX, accY, velX, velY = 0;
  float x, y, carWidth, carHeight;
  float angle;
  float limit;
  float anglePower;
  int r, g, b;
  float[] px = new float[20];
  float[] py = new float[20];
  Car(int tempX, int tempY) {
    r = 255;
    g = 0;
    b = 0;
    x = tempX;
    y = tempY;
    limit = 0.25;
    anglePower = 3;
    carWidth = 25;
    carHeight = 50;
    img = loadImage("pixel_car.png");
  }

  void display() {
    drift();
    pushMatrix();
    translate(x, y);
    rotate(radians(angle + 90));
    rectMode(CENTER);
    //fill(r, g, b);
    imageMode(CENTER);
    image(img, 0, 0);
    noFill();
    stroke(0);
    strokeWeight(2);
    rect(0, 0, carWidth, carHeight);
    //stroke(0);
    //strokeWeight(1);
    //line(0, 0, 0, -50);
    popMatrix();
  }

  void move() {
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
    x += velX;
    y += velY;

    velX += accX;
    velY += accY;

    accY *= accY/4;
    accX *= accX/4;

    velX = velX/1.04;
    velY = velY/1.04;
  }

  void simulate() {
    if (controls[3] == 1 && controls[0] == 1) {     //forward-left
      accX += cos(radians(angle)) * limit;
      accY += sin(radians(angle)) * limit;
      angle -= anglePower;
    } else if (controls[2] == 1 && controls[0] == 1) {     //forward-right
      accX += cos(radians(angle)) * limit;
      accY += sin(radians(angle)) * limit;
      angle += anglePower;
    } else if (controls[0] == 1) {            //forward
      accX += cos(radians(angle)) * limit;
      accY += sin(radians(angle)) * limit;
    } else if (controls[1] == 1) {     //back
      accX -= cos(radians(angle)) * limit;
      accY -= sin(radians(angle)) * limit;
    } else if (controls[2] == 1) {     //right
      angle += anglePower;
    } else if (controls[3] == 1) {     //left
      angle -= anglePower;
    } else {
      accX = 0;
      accY = 0;
    }
  }

  void drift() {
    // println(velX, velY);
    if (abs(abs(velX) - abs(velY)) <= 4 && abs(velX) > 0.5 && abs(velY) > 0.5) {
      px = append(px, x);
      py = append(py, y);
    } else {
      px = new float[20];
      py = new float[20];
      // println(velX, velY);
    }
    for (int i = 1; i < px.length; i++) {
      if (px[i-1] != 0 && px[i] != 0) {
        stroke(10, 50);
        strokeWeight(6);
        line(px[i-1] + 8, py[i-1] + 20, px[i] + 8, py[i] + 20);
        line(px[i-1] - 8, py[i-1] + 20, px[i] - 8, py[i] + 20);
        line(px[i-1] + 8, py[i-1] - 20, px[i] + 8, py[i] - 20);
        line(px[i-1] - 8, py[i-1] - 20, px[i] - 8, py[i] - 20);
      }
    }
  }
}

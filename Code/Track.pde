float innerX, innerY, outerX, outerY, firstLimit;
boolean lapBool;
int lapCount;
PrintWriter output;

class Track {
  Track() {
    innerX = 1100;
    innerY = 400;
    outerX = 1500;
    outerY = 700;
    lapBool = true;
    lapCount = 0;
    firstLimit = 0.25;
  }

  void display() {
    output = createWriter("score.txt");
    stroke(0);
    strokeWeight(3);
    fill(100);
    rectMode(CENTER);
    rect(width/2, height/2, outerX, outerY);

    stroke(0);
    strokeWeight(3);
    fill(100, 255, 100);
    rectMode(CENTER);
    rect(width/2, height/2, innerX, innerY);

    //finish line 1
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(width/2, 675, 25, (outerY - innerY)/2 - 5);

    //finish line 2
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(width/2, 125, 25, (outerY - innerY)/2 - 5);

    //text counter

    fill(0);
    textSize(128);
    textAlign(CENTER, BOTTOM);
    text("SCORE: " + lapCount, width/2, height/2);
  }

  void keepTrack() {
    //println(car.x, width/2 - outerX/2);
    if (car.x > width/2 + outerX/2 || car.x < width/2 - outerX/2) {
      car.g = 255;
    } else if (car.y > height/2 + outerY/2 || car.y < height/2 - outerY/2) {
      car.g = 255;
    } else if ((car.x < width/2 + innerX/2 && car.x > width/2 - innerX/2) && (car.y < height/2 + innerY/2 && car.y > height/2 - innerY/2)) {
      car.g = 255;
    } else {
      car.r = 255;
      car.g = 0;
      car.b = 0;
    }

    if (car.x < width/2 + 12.5 && car.x > width/2 - 12.5 && car.y > 625 && car.y < 725 && lapBool == false) {
      lapBool = true;
      lapCount ++;
      //println("lap! " + lapCount);
      boost();
      //println("boosted to: " + car.limit);
    } else if (car.x < width/2 + 12.5 && car.x > width/2 - 12.5 && car.y < 200 && car.y > 50 && lapBool == true) {
      lapBool = false;
      lapCount ++;
      //println("lap! " + lapCount);
      boost();
      //println("boosted to: " + car.limit);
    }
    output.println(lapCount);
    output.flush();
    output.close();
    endGame();
  }

  void endGame() {
    if (car.g == 255) {
      car.x = 250;
      car.y = 150;
      car.accX = 0;
      car.accY = 0;
      car.velX = 0;
      car.velY = 0;
      car.angle = 0;
      println("Death! Final score = " + lapCount);
      lapCount = 0;
      lapBool = true;
      car.limit = firstLimit;
    }
  }

  void boost() {
    car.limit += 0.005 * (lapCount);
  }
}

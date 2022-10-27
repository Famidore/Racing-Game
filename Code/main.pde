Car car;
Track track;
GUI gui;

byte[] controls;

void setup() {
  size(1600, 800);
  track = new Track();
  car = new Car(250, 150);
  gui = new GUI(400, 400);
  controls = new byte[4];
};

void draw() {
  background(100, 255, 100);
  track.display();
  track.keepTrack();
  car.display();
  car.move();
  car.simulate();
  gui.display();
};

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      controls[0] = 1;
    }
    if (keyCode == DOWN) {
      controls[1] = 1;
    }
    if (keyCode == RIGHT) {
      controls[2] = 1;
    }
    if (keyCode == LEFT) {
      controls[3] = 1;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      controls[0] = 0;
    }
    if (keyCode == DOWN) {
      controls[1] = 0;
    }
    if (keyCode == RIGHT) {
      controls[2] = 0;
    }
    if (keyCode == LEFT) {
      controls[3] = 0;
    }
  }
}

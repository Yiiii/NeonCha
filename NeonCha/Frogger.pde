class Frogger {

  PVector position;
  int size;
  boolean p1u, p1d, p1l, p1r;
  float frogSpeed;

  Frogger() {
    size = 50;
    frogSpeed = 10;
    position = new PVector(width/2, height/10);
  }


  void display() {
    fill(0, 200, 0);
    rectMode(CENTER);
    rect(position.x, position.y, size, size);
  }

  void move() {
    if (p1u) {
      position.y -= frogSpeed;
    }
    if (p1d) {
      position.y += frogSpeed;
    }
    if (p1l) {
      position.x -= frogSpeed;
    }
    if (p1r) {
      position.x += frogSpeed;
    }
  }


  void keyPressed() {
    if (key == CODED) {
      if (key == UP) {
        p1u = true;
        p1d = false;
        p1l = false;
        p1r = false;
      }
    }
    if (key == CODED) {
      if (key == DOWN) {
        p1u = false;
        p1d = true;
        p1l = false;
        p1r = false;
      }
    }
    if (key == CODED) {
      if (key == LEFT) {
        p1u = false;
        p1d = false;
        p1l = true;
        p1r = false;
      }
    }
    if (key == CODED) {
      if (key == RIGHT) {
        p1u = false;
        p1d = false;
        p1l = false;
        p1r = true;
      }
    }
  }

  void keyReleased() {
    if (key == UP) {
      p1u = false;
    }
    if (key == DOWN) {
      p1d = false;
    }
    if (key == LEFT) {
      p1l = false;
    }
    if (key == RIGHT) {
      p1r = false;
    }
  }

  void collision() {
  }
}


class Frogger {

  PVector position;
  int size;
  float frogSpeed;

  Frogger() {
    size = 50;
    frogSpeed = 10;
    position = new PVector(width/2, height);
  }


  void display() {
    fill(0, 200, 0);
    rectMode(CENTER);
    rect(position.x, position.y, size, size);
  }



  void move() {
    if (upPressed == true) {
      position.y -= frogSpeed;
    }
    if (downPressed == true) {
      position.y += frogSpeed;
    }
    if (leftPressed == true) {
      position.x -= frogSpeed;
    }
    if (rightPressed == true) {
      position.x += frogSpeed;
    }
  }


  void collision() {
  }
}


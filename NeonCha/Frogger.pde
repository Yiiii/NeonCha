class Frogger {

  PVector position=new PVector(width/2, height);;
  int size;


  Frogger() {
    size = 50;
    frogSpeed = 0;
  

   
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
    if (position.x - (size/2) < 0) {
    position.x += frogSpeed;
    }
    if (position.x + (size/2) > width) {
    position.x -= frogSpeed;
    }
    if (position.y - (size/2) < 0) {
    position.y += frogSpeed;
    }
    if (position.y + (size/2) > height) {
    position.y -= frogSpeed;
    }
  }
}


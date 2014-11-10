class C {
  PVector posC = new PVector(0, height-150);

  float velC;
  PImage spaceship3;

  C(float positionX) {
   posC.x = positionX;

    velC = 2;
    spaceship3 = loadImage("spaceship3.gif");

  }
  void display() {
    image(spaceship3, posC.x, posC.y);
    
  }

  void move() {
    posC.x -= velC;
    println(posC.x);
    println(velC);
  }
  void collision() {
    if (posC.x < -110) {
      posC.x = width;
    }
  }
}


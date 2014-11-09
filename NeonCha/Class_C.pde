class C {
  PVector posC = new PVector(0, height-50);

  float velC;
  PImage spaceship3;

  C(float positionX) {
   posC.x = positionX;

    velC = 2;
    spaceship3 = loadImage("spaceship.gif");

  }
  void display() {
    image(spaceship3, posC.x, posC.y);
    
  }

  void move() {
    posC.x -= velC;
    println(posC.x);
    println(velC);
  }
}


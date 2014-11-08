class B {
  PVector posB = new PVector(0, 210+height/10);

  float velB;
  PImage spaceship2;

  B(float positionX) {
   posB.x = positionX;

    velB = 2;
    spaceship2 = loadImage("spaceship2.gif");

  }

  void display() {
    image(spaceship2, posB.x, posB.y);
    // noStroke();
    //rectMode(CENTER);
     //rect(posA.x, posA.y, 20, 20);
  }

  void move() {
    posB.x += velB;
    println(posB.x);
    println(velB);
  }
  void collision() {
   if (posB.x > width+110) {
    posB.x = -110;
   } 
  }
}


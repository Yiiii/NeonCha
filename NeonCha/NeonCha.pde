// Collaboration of Yi, Angela, Gentry and Yumeng
Space[] spaceParticles = new Space[200];
Frogger frog;
//CreaturePrime guy;
boolean upPressed;
boolean downPressed;
boolean rightPressed;
boolean leftPressed;

void setup() {
  size(600, 600);

  for (int i = 0; i <spaceParticles.length; i++) {
    spaceParticles[i] = new Space(random(1, 3), random(0, width), random(0, height));
  }
  frog = new Frogger();
  //guy = new CreaturePrime();
  //guy.prime();
}

void draw() {
background(0);

  
  for (int i = 0; i <spaceParticles.length; i++) {
    spaceParticles[i].display();
    spaceParticles[i].move();
    spaceParticles[i].collision();
    PVector wind = new PVector (0, .005);
    spaceParticles[i].applyForce(wind);
  }

  frog.display();
  frog.move();
  //guy.update();
} 


void timer() {
}


void score() {
}

void startScreen() {
}

void endScreen() {
}


void keyPressed() {
      if (keyCode == 'W') {
        upPressed=true;
      }
 
      if (keyCode== 'S') {
        downPressed=true;
      }
      if (keyCode=='A') {
        leftPressed=true;
      }
      if (keyCode=='D') {
        rightPressed=true;
      }
    }
 
    void keyReleased() {
      if (keyCode == 'W') {
        upPressed=false;
      }
 
      if (keyCode== 'S') {
        downPressed=false;
      }
      if (keyCode=='A') {
        leftPressed=false;
      }
      if (keyCode=='D') {
        rightPressed=false;
      }
    }


// Collaboration of Yi, Angela, Gentry and Yumeng
Space[] spaceParticles = new Space[200];
Frogger frog;

void setup() {
  size(600,600);
  frog = new Frogger();
  for(int i = 0; i <spaceParticles.length; i++) {
  spaceParticles[i] = new Space(random(1,3),random(0,width),random(0,height));
  
  }
}

void draw() {
  background(0);
  frog.display();
  frog.move();
  frog.keyPressed();
  frog.keyReleased();

  for(int i = 0; i <spaceParticles.length; i++) {
  spaceParticles[i].display();
  spaceParticles[i].move();
  spaceParticles[i].collision();
  PVector wind = new PVector (0,.005);
  spaceParticles[i].applyForce(wind);
  
  }
}


void timer() {
}


void score() {
}

void startScreen() {
}

void endScreen() {
}





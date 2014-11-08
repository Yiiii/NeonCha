// Collaboration of Yi, Angela, Gentry and Yumeng
Space[] spaceParticles = new Space[200];
Frogger frog;
A[] spaceship1 = new A[50];
B[] spaceship2 = new B[10];


boolean upPressed;
boolean downPressed;
boolean rightPressed;
boolean leftPressed;
float frogSpeed;
int bigness;

void setup() {
  size(600, 600);
  bigness = 1;
<<<<<<< HEAD
=======
  
//pictures
  frogEnd=loadImage("frog_end.png");
  frogEndVel=new PVector(random(-10,10),random(-10,10));
  frogEndVel=new PVector(0,-5);
  frogStart=loadImage("frog_start.png");
  startText=loadImage("starttext.png");
  //life point
  lifePoint=6;
  r=0;
//  frog.position.x=width/2;
//  frog.position.y=650;
>>>>>>> parent of f5f4e40... Minor Fix 01

  for (int i = 0; i <spaceParticles.length; i++) {
    spaceParticles[i] = new Space(random(1, 3), random(0, width), random(0, height));
  }

  frog = new Frogger();
<<<<<<< HEAD

  for (int i = 0; i <spaceship1.length; i++) {
    spaceship1[i] = new A(i*random(240,260));
  }

  for (int i = 0; i <spaceship2.length; i++) {
    spaceship2[i] = new B(i*random(240,260));
  }

=======
  //guy = new CreaturePrime();
  //guy.prime();
>>>>>>> parent of f5f4e40... Minor Fix 01
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

  for (int i = 0; i <spaceship1.length; i++) {
    spaceship1[i].display();
    spaceship1[i].move();
  //  println(spaceship1[i]);
  }

  for (int i = 0; i <spaceship2.length; i++) {
    spaceship2[i].display();
    spaceship2[i].move();
    spaceship2[i].collision();
  
  }


  sections();
  endZone();
  frog.display();
  frog.move();
  frog.collision();
} 

//These are the boundaries that separate the spaceship paths. think of these as safe zones for our frogger class.
void sections() {
  rectMode(CENTER);
  stroke(255);
  fill(100, 100);
  for (int i = 0; i <6; i++) {
    rect(width/2, (i*185)+20, width+5, height/10);
    //rect(width/2, 25, width+4, 54);
  }
}

//When the frog class fills all of these endZones, the winning screen will display.
void endZone () {
  //  rect(0,0,bigness,y);
}

//A clock countdown. When a certain amount of time passes, the game is reset and the player must try again.
void timer() {
}


void score() {
}

void startScreen() {
<<<<<<< HEAD
}
=======
//  if(gametime<1){
  image(startText,0,300);
    pushMatrix();
    translate(width/2,height/2-150);
  rotate(radians(r));
    image(frogStart,0,0);
    popMatrix();
    
    r+=1;
    //text:Click to start game. then the lifepoint will be set as 5
    }
  

>>>>>>> parent of f5f4e40... Minor Fix 01

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


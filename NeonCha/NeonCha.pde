// Collaboration of Yi, Angela, Gentry and Yumeng
Space[] spaceParticles = new Space[200];
Frogger frog;

boolean upPressed;
boolean downPressed;
boolean rightPressed;
boolean leftPressed;
float frogSpeed;
int bigness;

float r;//endscreen the frog will rotate
PImage frogEnd, frogStart;
PVector frogEndVel,frogStartVel;
int lifePoint;
int gametime=0;
Boolean justStart;
/*here means the frog has certaim life point, everytime the frog was hit,
its life point will minus one. Frog will die when its life point reaches zero.
this is just my imagination of the scoring. I'll do the start and end according to this.*/



void setup() {
  size(600, 600);
  bigness = 1;
  
//pictures
  frogEnd=loadImage("frog_end.png");
  frogEndVel=new PVector(random(-10,10),random(-10,10));
  frogEndVel=new PVector(0,-5);
  frogStart=loadImage("frog_start.png");
  //life point
  lifePoint=6;
  r=0;
//  frog.position.x=width/2;
//  frog.position.y=650;
  
  for (int i = 0; i <spaceParticles.length; i++) {
    spaceParticles[i] = new Space(random(1, 3), random(0, width), random(0, height));
  }
  frog = new Frogger();
  //guy = new CreaturePrime();
  //guy.prime();
}

void draw() {
 
background(0);
  score(); //use lifepoint to decide which screen should appear
  if(lifePoint>0){
    if(lifePoint<=5&&frog.position.y<650){
  //if lifepoint is bigger than 0, and frog has been moved, then play mode is on
  
  universe();

  sections();
  endZone();
  frog.display();
  frog.move();
  frog.collision();
  
}
  else {
    //if lifepoint is bigger than 0, and frog position is just ready, then start screen
  startScreen();
}
  }
  //if the lifepoint reaches 0, frog died and endScreen was shown
  else{
    endScreen();
  }
}
 

//These are the boundaries that separate the spaceship paths. think of these as safe zones for our frogger class.
void sections() {
  rectMode(CENTER);
  stroke(255);
  fill(100,100);
  for(int i = 0; i <4; i++) {
  rect(width/2,(i*185)+20,width+5,height/10);
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
//  /*when the frog was hit, its lifepoint minust one, so when he die, it was zero.*/
//  if(/*frog's frogPos.y<20*/){
//    /*win*/;
//  }
//  else if(/*frog's Pos overlaps the pos of moving stars*/){
//    lifepoint--;
//    hit();//here we can build an effect when the frog was hit
//  }
  
}

void winScreen() {
  
  
}


void startScreen() {
  if(gametime<1){
    universe();
    pushMatrix();
    translate(width/2,height/2);
  rotate(radians(r));
    image(frogStart,width/2,height/2);
    popMatrix();
    r+=5;
    //text:Click to start game. then the lifepoint will be set as 5
    }
  
  else{
    universe();
    frog.position.y=frog.position.y+frogStartVel.y;
    if(frog.position.y<=580){
    frogStartVel.y=0;
    }
    pushMatrix();
    translate(width/2,height/2);
  rotate(radians(r));
    image(frogStart, frog.position.x, frog.position.y);
    popMatrix();
    r+=5;
    //text
  }
}

void endScreen() {
  frog.position.x=width/2;
  frog.position.y=650;
  
  universe();
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(r));
  image(frogEnd,frog.position.x-frogEndVel.x,frog.position.y-frogEndVel.y);
  popMatrix();
  r+=5;
  
}

void hit(){
  
}


void mouseClicked(){
  if(lifePoint<=0){
  lifePoint=5;
  gametime++;
  }
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
    
    
    void universe(){
   for(int i = 0; i <spaceParticles.length; i++) {
  spaceParticles[i].display();
  spaceParticles[i].move();
  spaceParticles[i].collision();
  PVector wind = new PVector (0,.005);
  spaceParticles[i].applyForce(wind);
}
}


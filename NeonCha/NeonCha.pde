// Collaboration of Yi, Angela, Gentry and Yumeng
Space[] spaceParticles = new Space[200];
Frogger frog;
A[] spaceship1 = new A[3];
B[] spaceship2 = new B[10];
C[] spaceship3 = new C[2];

boolean upPressed;
boolean downPressed;
boolean rightPressed;
boolean leftPressed;
float frogSpeed;
int bigness;




float r;//endscreen the frog will rotate
PImage frogEnd, frogStart, startText,endText;
PVector frogEndVel, frogStartVel;
int lifePoint;
int gametime=0;
Boolean justStart;
int score;
int timeSizeX=100;
int timeSizeY=10;
int timePosX=470;
color c = color(0,255,0);
/*here means the frog has certaim life point, everytime the frog was hit,
 its life point will minus one. Frog will die when its life point reaches zero.
 this is just my imagination of the scoring. I'll do the start and end according to this.*/

int savedTime;
int totalTime = 60000;



void setup() {
  size(600, 600);
  bigness = 1;
  savedTime = millis();


  //pictures

  

//pictures

  frogEnd=loadImage("frog_end.png");
  frogEndVel=new PVector(random(-10, 10), random(-10, 10));
  frogStart=loadImage("frog_start.png");
  startText=loadImage("starttext.png");
  endText=loadImage("endtext.png");
  //life point
  lifePoint=6;
  r=0;






  




  for (int i = 0; i <spaceParticles.length; i++) {
    spaceParticles[i] = new Space(random(1, 3), random(0, width), random(0, height));
  }
  frog = new Frogger();
  //guy = new CreaturePrime();
  //guy.prime();

  frog.position.x=width/2;
  frog.position.y=650;

  for (int i = 0; i <spaceship1.length; i++) {
    spaceship1[i] = new A(i*random(240, 260));
  }

  for (int i = 0; i <spaceship2.length; i++) {
    spaceship2[i] = new B(i*random(240, 260));
  }
  
  for (int i = 0; i <spaceship3.length; i++) {
    spaceship3[i] = new C(i*random(240, 260));
  }
}

void draw() {

  background(0);
  universe();



  

  if (lifePoint>0) {
    if (lifePoint<=5) {
      //if lifepoint is bigger than 0, and frog has been moved, then play mode is on

      for (int i = 0; i <spaceship1.length; i++) {
        spaceship1[i].display();
        spaceship1[i].move();
        spaceship1[i].collision();
        //  println(spaceship1[i]);
      }

      for (int i = 0; i <spaceship2.length; i++) {
        spaceship2[i].display();
        spaceship2[i].move();
        spaceship2[i].collision();
      }
      for (int i = 0; i <spaceship3.length; i++) {
        spaceship3[i].display();
        spaceship3[i].move();
        spaceship3[i].collision();
      }


      score(); //use lifepoint to decide which screen should appear
      timer();
      sections();
      endZone();
      frog.display();
      frog.move();
      frog.collision();
      hit();//here!!!!
      
    } else {
      //if lifepoint is bigger than 0, and frog position is just ready, then start screen
      startScreen();
    }




  }
  //if the lifepoint reaches 0, frog died and endScreen was shown
  else {
    endScreen();
  }
  //println(mouseX, mouseY);
}



  
  
  



//These are the boundaries that separate the spaceship paths. think of these as safe zones for our frogger class.
void sections() {
  rectMode(CENTER);
  stroke(255);
  fill(100, 100);
  for (int i = 0; i <4; i++) {
    rect(width/2, (i*185)+20, width+5, height/10);
  }
}

//When the frog class fills all of these endZones, the winning screen will display.
void endZone () {

  //  rect(0,0,bigness,y);

//  rect(0,0,bigness,y);


  bigness = 50;
  rect((bigness/2),bigness/2,bigness,bigness);
  rect((width/2),bigness/2,bigness,bigness);
  rect((bigness/2)+width-bigness,bigness/2,bigness,bigness);
  

}

//A clock countdown. When a certain amount of time passes, the game is reset and the player must try again.
void timer() {
  
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
   lifePoint = 0; 
   savedTime = millis();

  } 
  
  rectMode(CORNER);
  fill(c);
  
  timeSizeX = -passedTime;
  float timeSize = map(timeSizeX,0,totalTime,0,60);

  rect(timePosX,570,timeSize+60,timeSizeY);
  stroke(255);
  noFill();
  rect(timePosX,570,60,timeSizeY);
   // timeSizeX-=0.0001;
println(timeSize+60,"time");
   
    if (timeSize+60 < 30 && timeSize+60 >= 10){
      c = color(255,255,0);
      println("YELLOW!");
    } else if (timeSize+60 < 10) {
     c = color(255,0,0); 
    } else {
     c = color(0,255,0);
     println("GREEN!");
    } 
    if (timeSize+60 <10) {
     fill(255,0,0,100);
     textSize(30);
     text(timeSize+60,frog.position.x+50,frog.position.y+50); 
    }
    
    
  
}


void score() {
  textSize(20);
  text(lifePoint, 100, 580);
  text("Lives",10,580);
  text("Time",540,580);
  //text(");
  
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
  //  if(gametime<1){
  image(startText, 0, 300);
  pushMatrix();
  translate(width/2, height/2-150);
  rotate(radians(r));
  image(frogStart, -50, 0);
  popMatrix();

  r+=1;
  //text:Click to start game. then the lifepoint will be set as 5
}



void endScreen() {
  frog.position.x=width/2;
  frog.position.y=height/2;
image(endText,0,300 );
  pushMatrix();
  translate(frog.position.x-frogEndVel.x, frog.position.y-frogEndVel.y);
  rotate(radians(r));
  image(frogEnd,0,0 );
  popMatrix();
  
  r+=1;
}

void hit() {
  //for the first line of spaceship 
  if(frog.position.y<550&&frog.position.y>420 ){
  for(int i=0;i<spaceship3.length;i++){
  if(frog.position.x+25 >= spaceship3[i].posC.x-55 && frog.position.x-25 <=  spaceship3[i].posC.x+55){
  lifePoint--;
  println(lifePoint);
  frog.position.y=600;
  frog.position.x = width/2;
  
  }
  }
  }
  
if(frog.position.y<360&&frog.position.y>242 ){
  for(int i=0;i<spaceship2.length;i++){
  if(frog.position.x+25 >= spaceship2[i].posB.x-30 && frog.position.x-25 <=  spaceship2[i].posB.x+30){
  lifePoint--;
  println(lifePoint);
  frog.position.y=600;
  frog.position.x = width/2;
  
  }
  }
}

  if(frog.position.y<180&&frog.position.y>55 ){
  for(int i=0;i<spaceship1.length;i++){
  if(frog.position.x+25 >= spaceship1[i].posA.x-55 && frog.position.x-25 <=  spaceship1[i].posA.x+55){
  lifePoint--;
  println(lifePoint);
  frog.position.y=600;
  frog.position.x = width/2;
  
  }
  }
  }
  
}


void mouseClicked() {
  if (lifePoint<=0||lifePoint==6) {
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


void universe() {
  for (int i = 0; i <spaceParticles.length; i++) {
    spaceParticles[i].display();
    spaceParticles[i].move();
    spaceParticles[i].collision();
    PVector wind = new PVector (0, .005);
    spaceParticles[i].applyForce(wind);
  }
}


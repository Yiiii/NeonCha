class Frogger {

  PVector position=new PVector(width/2, height);;
  int size;
  boolean endZone1;
  boolean endZone2;
  boolean endZone3;
  PImage FroggerCenter;
  PImage FroggerRight;
  PImage FroggerLeft;
  PImage sprite;
  
  
  


  Frogger() {
    size = 50;
    frogSpeed = 0;
    
    FroggerCenter = loadImage("Frogger_Center.gif");
    FroggerRight = loadImage("Frogger_Right.gif");
    FroggerLeft = loadImage("Frogger_Left.gif");
  

   
  }


  void display() {
    noStroke();
    fill(0, 200, 0);
    if (leftPressed == true) {
    sprite = FroggerLeft;
    } else if (rightPressed == true) {
    sprite = FroggerRight;
    } else {
    sprite = FroggerCenter;
    }
    image(sprite,position.x,position.y);
    //rectMode(CENTER);
    //rect(position.x, position.y, size, size);
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
    if (position.y + (size/2) >=  height) {
      // position.y = height-(size/2)-1;
      position.y -= frogSpeed;
    }

    if (position.y < 40) { 
      endZone1 = true;
    } 
 
       if (endZone1) {
      position.x = width/2;
      position.y = height-size;
      println(endZone1, "endzone 1");
      endZone1 = false;
    }
  }
    
  /* if (position.y < 40 && position.x > 550); 
    { 
      endZone3 = true;
    }
    if (endZone3) {
      position.x = width/2;
      position.y = height-size;
      endZone3 = false;
    } 
  }
  /*if (in this place) {
   endzone1 = true}
   
   if enzone1 = true {
   move the frog back to start;
   add one to score;
   fill end zone with a color;
   activate noise?
   
   } */
}


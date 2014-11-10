class Space {
  float mass;
  float posy;
  PVector acceleration;
  PVector velocity;
  PVector location;
  float maxSpeed;
  
 Space(float m, float x, float y) {
   mass = m;
   maxSpeed = 15;
   location = new PVector(0,0);
   velocity = new PVector(0,1);
   acceleration = new PVector(0,0);
   location.x = x;
   location.y = y;
 }

void display() {
  noStroke();
  fill(255,255,255,100);
  ellipse(location.x,location.y,mass,mass*velocity.y);
  
 
}

void move() {
  velocity.add(acceleration);
  velocity.limit(maxSpeed);
  location.add(velocity);
  frogSpeed = velocity.y;
  acceleration.mult(0);
  
  if (leftPressed == true) {
   velocity.x = 2; 
  } else if (rightPressed == true) {
   velocity.x = -2;
  } else if (downPressed == true) {
   velocity.y = 1;
  } else { 
   velocity.x = 0;
  }
  
  
  
}

void collision() {
  if(location.y > height) {
    location.y = 0;
  }
  if (location.x > width) {
   location.x = 0; 
  }
  if (location.x < 0) {
   location.x = width; 
  }
}

void applyForce(PVector force) {
  PVector f = PVector.mult(force,mass);
  velocity.add(f);
}
  
  
  
  
}

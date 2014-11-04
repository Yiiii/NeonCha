class Space {
  float mass;
  float posy;
  PVector acceleration;
  PVector velocity;
  PVector location;
  float maxSpeed;
  
 Space(float m, float x, float y) {
   mass = m;
   maxSpeed = 10;
   location = new PVector(0,0);
   velocity = new PVector(0,5);
   acceleration = new PVector(0,0);
   location.x = x;
   location.y = y;
 }

void display() {
  noStroke();
  fill(255);
  ellipse(location.x,location.y,mass,mass*4);
  
 
}

void move() {
  velocity.add(acceleration);
  velocity.limit(maxSpeed);
  location.add(velocity);
  acceleration.mult(0);
  
  
  
}

void collision() {
  if(location.y > height) {
    location.y = 0;
  }
}

void applyForce(PVector force) {
  PVector f = PVector.div(force,mass);
  acceleration.add(f);
}
  
  
  
  
}

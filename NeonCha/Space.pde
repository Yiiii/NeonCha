class Space {
  float mass;
  float posy;
  PVector acceleration;
  PVector velocity;
  PVector location;
 space(float m, float y) {
   mass = m;
   posy = y;
   location = new PVector(random(0,width),0);
   velocity = new PVector(0,1);
 }

void display() {
  ellipse(location.x,location.y,mass,mass*2);
  
 
}

void move() {
  velocity.add(acceleration);
  velocity.limit(maxspeed);
  location.add(velocity);
  acceleration.mult(0);
  
}

void collision() {
  
}

void applyForce(PVector force) {
  PVector f = PVector.div(force,mass);
  acceleration.add(f);
}
  
  
  
  
}

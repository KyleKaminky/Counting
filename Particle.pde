// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  String number;
  int text_color;

  Particle(PVector l, String n, int c) {
    //acceleration = new PVector(0, 0.05);
    velocity = new PVector(0, 1);
    position = l.copy();
    lifespan = 255.0;
    number = n;
    text_color = c;
    
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    //velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 0.5;
  }

  // Method to display
  void display() {
    stroke(text_color, lifespan);
    fill(text_color, lifespan);
    //ellipse(position.x, position.y, 8, 8);
    text(number, position.x, position.y);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

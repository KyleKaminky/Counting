// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  int text_color;

  ParticleSystem(PVector position, int c) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
    text_color = c;
  }

  void addParticle(String n) {
    particles.add(new Particle(origin, n, text_color));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class Bubbles {
  int hu = int(random(0, 255));

  //float mass;

  // Dimensions
  int radius;
  float coordX;
  float coordY;
  float speedX = random(-4, 4);
  float speedY = random(-4, 4);

  Bubbles(float posX, float posY, int radius) {
    //this.mass = 5;
    this.coordX = posX;
    this.coordY = posY;
    this.radius = radius;
  } 

  boolean intersects(Bubbles other) {
    float xDistance = other.coordX - this.coordX;
    float yDistance = other.coordY - this.coordY;
    float sqrtDistance = sqrt(pow(xDistance, 2.0) + pow(yDistance, 2.0));
    //return (sqrtDistance < this.radius + other.radius);
    return (sqrtDistance - radius * 2.0 < 0);
  }

  void randomCoords() {
    this.coordX = random(radius, width - radius);
    this.coordY = random(radius, height - radius);
  }

  float returnX() {
    return this.coordX;
  }

  float returnY() {
    return this.coordY;
  }

  void colorize() {
    hu += 1;
    if (hu > 255)
      hu = 0;
  }

  void move() {
    if (this.coordX > width - this.radius || this.coordX < 0 + this.radius)
      speedX *= -1.0;
    if (this.coordY > height - this.radius || this.coordY < 0 + this.radius)
      speedY *= -1.0;        

    this.coordX += speedX;
    this.coordY += speedY;
  }

  void display() {
    //noStroke();
    //fill(hu, 255, 255, 128);
    //ellipseMode(RADIUS);
    //ellipse(this.coordX, this.coordY, this.radius, this.radius);
    imageMode(CENTER);
    image(blebby, this.coordX, this.coordY, this.radius * 2, this.radius * 2);
    tint(hu, 255, 255, 255);
  }
}

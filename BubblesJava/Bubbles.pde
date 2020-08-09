class Bubbles {
  Body bBody; 

  int hu = int(random(0, 255));

  //float mass;

  // Dimensions
  int radius;
  float coordX;
  float coordY;
  float speedX = random(-4, 4);
  float speedY = random(-4, 4);

  Bubbles(float posX, float posY, int radius) {
    this.coordX = posX;
    this.coordY = posY;
    this.radius = radius;

    // Box 2D

    BodyDef bubbleBody = new BodyDef();
    bubbleBody.type = BodyType.DYNAMIC;
    bubbleBody.position.set(box2d.coordPixelsToWorld(this.coordX, this.coordY));

    // Create Body

    bBody = box2d.createBody(bubbleBody);

    // Define Body

    CircleShape cs = new CircleShape();
    float box2Dr = box2d.scalarPixelsToWorld(this.radius);
    cs.m_radius = box2Dr;

    // Create Fixture

    FixtureDef bubbleFixture = new FixtureDef();
    bubbleFixture.shape = cs;

    // Fixture parameters
    
    // I have no clue what to set that for

    bubbleFixture.density = 2;
    bubbleFixture.friction = 5;
    bubbleFixture.restitution = 1.5;

    // Attach Shape to Body + Fixture

    bBody.createFixture(bubbleFixture);
    bBody.setGravityScale(0.7);
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

  /*void move() {
    
    if (this.coordX > width - this.radius || this.coordX < 0 + this.radius)
     speedX *= -1.0;
     if (this.coordY > height - this.radius || this.coordY < 0 + this.radius)
     speedY *= -1.0;        
     
     this.coordX += speedX;
     this.coordY += speedY;

  }*/
  

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(bBody);
    float a = bBody.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    ellipseMode(RADIUS);
    fill(hu, 255, 255, 128);
    ellipse(0, 0, this.radius, this.radius);    
    popMatrix();
    
    //noStroke();    
    //ellipse(this.coordX, this.coordY, this.radius, this.radius);
    //imageMode(CENTER);
    //image(blebby, this.coordX, this.coordY, this.radius * 2, this.radius * 2);
    //tint(hu, 255, 255, 255);
  }
}

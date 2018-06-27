import shiffman.box2d.*;

class Boundaries {
  Body body;

  Boundaries(float w, float h, float posx, float posy) {
    BodyDef bd2 = new BodyDef();
    bd2.type = BodyType.STATIC;
    bd2.position.set(box2d.coordPixelsToWorld(posx, posy));   
    body = box2d.createBody(bd2);

    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w);
    float box2Dh = box2d.scalarPixelsToWorld(h);

    ps.setAsBox(box2Dw, box2Dh);

    FixtureDef fd2 = new FixtureDef();
    fd2.shape = ps;

    // Fixture parameters

    fd2.density = 1;
    fd2.friction = 0.3;
    fd2.restitution = 0.5;

    // Attach Shape to Body + Fixture

    body.createFixture(fd2);
  }
  
  // Display as debug
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    /*
    fill(127);
    translate(pos.x, pos.y);
    rotate(-a);
    rectMode(CENTER);
    rect(0, 0, 50, 50);
    */
    popMatrix();
    
    
    //noStroke();    
    //ellipse(this.coordX, this.coordY, this.radius, this.radius);
    //imageMode(CENTER);
    //image(blebby, this.coordX, this.coordY, this.radius * 2, this.radius * 2);
    //tint(hu, 255, 255, 255);
  }
}

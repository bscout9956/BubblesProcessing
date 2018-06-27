import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

/*------------------------------------------------------------------------------------------------/
 
 Bubbles Screensaver recreation by BlackScout/bscout9956
 This is inspired by the Bubbles Screensaver (duh) made by Microsoft Corporation for Windows Vista+
 
 -------------------------------------------------------------------------------------------------*/
int bubbleCount = 20;
int radius = 40;
float startX;
float startY;
float coordX;
float coordY;
int count;

PImage blebby;

Bubbles[] blebs = new Bubbles[bubbleCount];
Boundaries[] bound = new Boundaries[4];

void setup() {
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  size(1280, 720, P2D);
  colorMode(HSB);
  
  blebby = loadImage("bubble.png");

  for (int i = 0; i < bubbleCount; i++) {
    startX = random(radius, width - radius);
    startY = random(radius, height - radius);
    blebs[i] = new Bubbles(startX, startY, radius);
    //println(i);
  }
  
 bound[0] = new Boundaries(1280, 1, 0, 0); //top
 bound[1] = new Boundaries(1280, 1, 0, 720); //bottom
 bound[2] = new Boundaries(1, 1280, 0, 0); //left
 bound[3] = new Boundaries(1, 1280, 1280, 720); //right  

  for (int l = 0; l < blebs.length; l++) {
    if (l != 0) {
      for (int j = 0; j < blebs.length; j++) {
        if (blebs[l].intersects(blebs[j])) {
          //println(blebs[l].intersects(blebs[j]));
          blebs[j].randomCoords();
        }
      }
    }
  }
}

void draw() {  
  background(0);
  
  box2d.step();  
  
  for (int i = 0; i < blebs.length; i++) {
    blebs[i].display();
    /*blebs[i].move();*/
    blebs[i].colorize();
  }
  
  for (int i = 0; i < bound.length; i++) {
    bound[i].display();
  }
  
}
// end of draw

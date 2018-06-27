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

void setup() {
  size(1280, 720, P2D);
  colorMode(HSB);
  
  blebby = loadImage("bubble.png");

  for (int i = 0; i < bubbleCount; i++) {
    startX = random(radius, width - radius);
    startY = random(radius, height - radius);
    blebs[i] = new Bubbles(startX, startY, radius);
    //println(i);
  }

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

/*void vertexHell() {
 
 }*/

void draw() {  
  background(0);
  for (int i = 0; i < blebs.length; i++) {
    blebs[i].display();
    blebs[i].move();
    blebs[i].colorize();
  }
}
// end of draw

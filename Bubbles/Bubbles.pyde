#add_library('box2d_processing')
#add_library('jbox2d')
"""

Bubbles Screensaver recreation by BlackScout/bscout9956

This is inspired by the Bubbles Screensaver (duh) made by Microsoft Corporation for Windows Vista+

"""

import Bubble
#import Boundaries

#box2d = Box2DProcessing(this)

bubbleCount = 20 # How many bubbles? Set it here

screenWidth = 1280
screenHeight = 720
pixelCount = screenWidth * screenHeight

Size = pixelCount / 10000 # Optimized size
#print("The diameter of each circle is: {0}".format(Size))

# An array for each bleb

blebs = [None] * (bubbleCount + 1)
#bound = [None] * 4

for x in range(0, bubbleCount + 1):
    blebs[x] = Bubble.Bubble(Size, screenWidth, screenHeight, x)
    
#bound[0] = Boundaries.Boundaries(1280, 1, 0, 0)  //top
#bound[1] = Boundaries.Boundaries(1280, 1, 0, 720) // bottom
#bound[2] = Boundaries.Boundaries(1, 1280, 0, 0) // left
#bound[3] = Boundaries.Boundaries(1, 1280, 1280, 720) //right

def setup():
    #box2d = Box2DProcessing()
    #box2d.createWorld()
    
    size(screenWidth, screenHeight, P2D)
    colorMode(HSB)    

def draw():
    background(10)
    
    #box2d.step()
    
    for x in range(0, bubbleCount + 1):
        blebs[x].bounce()
        blebs[x].colorize()
        blebs[x].display()   
        
    #for y in range(0, len(bound) + 1):
        #bound[y].display() 
        
                
        

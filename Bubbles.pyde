"""

Bubbles Screensaver recreation by BlackScout/bscout9956

This is inspired by the Bubbles Screensaver (duh) made by Microsoft Corporation for Windows Vista+

"""

import Bubble

bubbleCount = 10 # How many bubbles? Set it here
bubbleCount += 1 # Lists boogaloo

screenWidth = 1280
screenHeight = 720
pixelCount = screenWidth * screenHeight

Size = pixelCount / 10000 # Optimized size
print("The diameter of each circle is: {0}".format(Size))

# An array for each bleb

blebs = [None] * bubbleCount

for x in range(0, bubbleCount):
    blebs[x] = Bubble.Bubble(Size, screenWidth, screenHeight, x)

def setup():
    size(screenWidth, screenHeight)

def draw():
    background(10)
    for x in range(0, bubbleCount):
        blebs[x].bounce()
        blebs[x].colorize()
        blebs[x].display()                 
                
        

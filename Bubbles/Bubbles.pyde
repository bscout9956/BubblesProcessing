"""

Bubbles Screensaver recreation by BlackScout/bscout9956

This is inspired by the Bubbles Screensaver (duh) made by Microsoft Corporation for Windows Vista+

"""

import Bubble

bubbleCount = 20 # How many bubbles? Set it here

screenWidth = 1280
screenHeight = 720
pixelCount = screenWidth * screenHeight

Size = pixelCount / 10000 # Optimized size
#print("The diameter of each circle is: {0}".format(Size))

# An array for each bleb

bubble_list = list()

for x in range(0, bubbleCount):
    bubble_list.append(Bubble.Bubble(Size, screenWidth, screenHeight))

def setup():   
    size(screenWidth, screenHeight, P2D)
    colorMode(HSB)    

def draw():
    background(10)
    
    for bubble in bubble_list:
        bubble.bounce()
        bubble.colorize()
        bubble.display()      
                
        

class Bubble(object):
    def __init__(self, diameter, sWidth, sHeight, bubbleid):
        self.diameter = diameter
        self.sWidth = sWidth
        self.sHeight = sHeight
        self.radius = self.diameter / 2
        
        # Movement and Position stuff
        
        """ Some of it is randomized as a necessity, some just so it looks slightly more natural """
        
        self.posx = random(50, 1280 - self.radius)
        self.posy = random(50, 720 - self.radius)
        self.speedx = random(1, 4)
        self.speedy = random(1, 4)
        self.dirx = int(random(-2, 2))
        self.diry = int(random(-2, 2))
        
        # Color stuff
        
        """ We randomize this as to look natural """
        
        self.random_r = int(random(-1, 2))
        self.random_g = int(random(-1, 2))
        self.random_b = int(random(-1, 2))
        
        """ The logic mess is a mere workaround. Initial code was sometimes rendering the bubbles white or black because of the nature of RGB. """
        
        if self.random_r == 1:    
            self.r_increasing = True
        else:
            self.r_increasing = False
            
        if self.random_g == 1:    
            self.g_increasing = True
        else:
            self.g_increasing = False
            
        if self.random_b == 1:    
            self.b_increasing = True
        else:
            self.b_increasing = False
        
        self.r = int(random(20, 255))
        self.g = int(random(20, 255))
        self.b = int(random(20, 255))
        self.a = 128
        
        # Misc
        
        self.bubbleid = bubbleid # Why would anyone need an ID?
        
        #print("Initial color is R {0} G {1} B {2} A {3} and ID is {4}".format(self.r, self.g, self.b, self.a, self.ballid))
        #print("Speeds are {0}, {1}".format(self.speedx, self.speedy))
        #print("Directions are {0}, {1}".format(self.dirx, self.diry))
    
        
    # Used to colorize whatever you wish
    
    """ 
    
    Once the code is done increasing one channel it steps into increasing another. They won't both increase at the same time therefore no white or black bubbles. 
    
    """
                
    def colorize(self):
        if self.r_increasing == True:
            self.r += 1
            if self.r == 255:
                self.r_increasing = False
                self.g_increasing = True
        else:
            self.r -= 1
            if self.r == 0:
                self.r_increasing = True
        
        if self.g_increasing == True:
            self.g += 1
            if self.g == 255:
                self.g_increasing = False
                self.b_increasing = True  
        else:
            self.g -= 1
            if self.g == 0:                
                self.g_increasing = True
                
        if self.b_increasing == True:
            self.b += 1
            if self.b == 255:
                self.b_increasing = False
                self.r_increasing = True
        else:
            self.b -= 1
            if self.b == 0:
                self.b_increasing = True
        
        #print("Color is R {0} G {1} B {2} A {3} and ID is {4}".format(self.r, self.g, self.b, self.a, self.ballid))
    
    def display(self):
        self.colour = color(self.r, self.g, self.b, self.a)
        noStroke()
        fill(self.colour)
        ellipse(self.posx, self.posy, self.diameter, self.diameter)
        #fill(255)
        #textSize(self.radius / 4)
        #text("B u b b l e", self.posx - self.radius / 2, self.posy)
        
    
    def bounce(self):
        #print("Pos Y:", self.posy)
        #print("Pos X:", self.posx)
        
        if self.posx < 0 + self.radius or self.posx > width - self.radius:
            self.dirx *= -1
        
        if self.posy > height - self.radius or self.posy < 0 + self.radius:
            self.diry *= -1
          
        if self.dirx == -1:
            self.posx += self.speedx
        elif self.dirx == 0:
            self.dirx = int(random(-2, 2))
        else:
            self.posx -= self.speedx
        
        if self.diry == -1:
            self.posy += self.speedy
        elif self.diry == 0:
            self.diry = int(random(-2, 2))
        else:
            self.posy -= self.speedy
            
            
            

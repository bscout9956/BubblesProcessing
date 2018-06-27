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
        self.speedx = random(-4, 4)
        self.speedy = random(-4, 4)
        
        # Color stuff
        
        self.hu = int(random(0, 255))
        
        #print("Speeds are {0}, {1}".format(self.speedx, self.speedy))
        #print("Directions are {0}, {1}".format(self.dirx, self.diry))
           
    def colorize(self):
        self.hu += 1
        if self.hu > 255:
            self.hu = 0        
    
    def display(self):
        self.colour = color(self.hu, 255, 255, 128)
        noStroke()
        fill(self.colour)
        ellipse(self.posx, self.posy, self.diameter, self.diameter)
    
    def bounce(self):
        #print("Pos Y:", self.posy)
        #print("Pos X:", self.posx)
        
        if self.posx < 0 + self.radius or self.posx > width - self.radius:
            self.speedx *= -1
        
        if self.posy > height - self.radius or self.posy < 0 + self.radius:
            self.speedy *= -1
          
        self.posx += self.speedx
        self.posy += self.speedy

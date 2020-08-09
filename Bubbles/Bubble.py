class Bubble():
    def __init__(self, diameter, screen_width, screen_height):
        self.diameter = diameter
        self.screen_width = screen_width
        self.screen_height = screen_height
        self.radius = self.diameter / 2
        
        # Movement and Position stuff
        
        """ Some of it is randomized as a necessity, some just so it looks slightly more natural """
        
        self.pos_x = random(50, 1280 - self.radius)
        self.pos_y = random(50, 720 - self.radius)
        self.speed_x = random(-4, 4)
        self.speed_y = random(-4, 4)
        
        # Color stuff
        
        self.color_hue = int(random(0, 255))
        
        #print("Speeds are {0}, {1}".format(self.speed_x, self.speed_y))
        #print("Directions are {0}, {1}".format(self.dirx, self.diry))
           
    def colorize(self):
        self.color_hue += 1
        if self.color_hue > 255:
            self.color_hue = 0        
    
    def display(self):
        self.colour = color(self.color_hue, 255, 255, 128)
        noStroke()
        fill(self.colour)
        ellipse(self.pos_x, self.pos_y, self.diameter, self.diameter)
    
    def bounce(self):
        #print("Pos Y:", self.pos_y)
        #print("Pos X:", self.pos_x)
        
        if self.pos_x < 0 + self.radius or self.pos_x > width - self.radius:
            self.speed_x *= -1
        
        if self.pos_y > height - self.radius or self.pos_y < 0 + self.radius:
            self.speed_y *= -1
          
        self.pos_x += self.speed_x
        self.pos_y += self.speed_y

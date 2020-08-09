add_library('box2d_processing')
add_library('jbox2d')

class Boundaries(object):
    
    def __init__(self, w, h, posx, posy):
        bd2 = jbox2d.BodyDef()
        bd2.type = BodyType.STATIC
        bd2.position.set(box2d.coordPixelsToWorld(posx, posy))
        body = box2d.createBody(bd2)
        
        ps = PolygonShape()        
        this.box2Dw = box2d.scalarPixelsToWorld(w)
        this.box2Dh = box2d.scalarPixelsToWorld(h)
        
        ps.setAsBox(box2Dw, box2Dh)
        
        fd2 = FixtureDef()
        fd2.shape = ps
        fd2.density = 1
        fd2.friction = 0.3
        fd2.restitution = 0.5
        
        body.createFixture(fd2)
        
        def display():
            pos = box2d.getBodyPixelCoord(body)
            a = body.getAngle()
            pushMatrix()
            fill(127)
            translate(pos.x, pos.y)
            rotate(-a)
            rectMode(CENTER)
            rect(0, 0, 50, 50)
            popMatrix()
        
        
        

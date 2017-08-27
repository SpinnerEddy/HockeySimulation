class Wall{
  
  float wallWidth;
  float wallHeight;
  Body body;
  
  Wall(PVector pos,float w,float h){
    wallWidth = w;
    wallHeight = h;
    makebody(pos.x,pos.y,wallWidth,wallHeight);
    body.setUserData(this);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    fill(0);
    stroke(0);
    pushMatrix();
    translate(pos.x,pos.y);
    rectMode(CENTER);
    rect(0,0,wallWidth,wallHeight);
    popMatrix();
  }
  
  void makebody(float x, float y, float w,float h){
    // Define the polygon
    PolygonShape ps = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    ps.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 1;
    
    // Attached the shape to the body using a Fixture
    body.createFixture(ps,1);
  }
}
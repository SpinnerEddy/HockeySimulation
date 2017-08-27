class Hockey{
  //PVector position;
  //PVector velocity;
  //PVector acceleration;
  
  //float velocityLimit;
  Body body;
  float mass;
  float radius;
  float angle;
  float hu;
  
  boolean existFlag;
  
  Hockey(PVector pos,float h){
    hu = h;
    radius = 6;
    makeBody(pos.x,pos.y,radius);
    body.setUserData(this);
    existFlag = false;
  }
  
  void kill(){
    box2d.destroyBody(body);
  }
  
  boolean done(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height || existFlag == true){
      kill();
      return true;
    }
    return false;
  }
  
  Vec2 getPosition(){
    return box2d.getBodyPixelCoord(body);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(body.getAngle());
    colorMode(HSB);
    stroke(0);
    fill(hu,255,255,255);
    ellipse(0,0,radius*2,radius*2);
    popMatrix();
  }
  
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 1;
    
    // Attach fixture to body
    body.createFixture(fd);

    // Give it a random initial velocity (and angular velocity)
    body.setLinearVelocity(new Vec2(random(-10f,10f),random(-10f,10f)).mulLocal(3));
    body.setAngularVelocity(random(-10,10));
  }
}
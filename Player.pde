class Player extends Wall{
  
  Player(PVector pos,float w,float h){
    super(pos,w,h);
    body.setUserData(this);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    colorMode(RGB);
    fill(0,0,255,255);
    noStroke();
    pushMatrix();
    translate(pos.x,pos.y);
    rectMode(CENTER);
    rect(0,0,wallWidth,wallHeight);
    popMatrix();
  }
}
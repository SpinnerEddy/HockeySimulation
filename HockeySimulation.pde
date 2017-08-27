import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

//ArrayList<Hockey> hockeys;
HockeySystem hs;
Wall wall;
ArrayList<Wall> walls;

ScoreSystem ss;

Player player1;
Goal goal1;

Player player2;
Goal goal2;

void setup(){
  size(900,900);
  background(255);
  //hockeys = new ArrayList<Hockey>();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  box2d.setGravity(0f,0f);
  hs = new HockeySystem(new PVector(width/2,height/2));
  walls = new ArrayList<Wall>();
  addWall(new PVector(width/2,100),width,200);
  addWall(new PVector(width/2,height-100),width,200);
  goal1 = new Goal(new PVector(10,height/2),20,500);
  player1 = new Player(new PVector(50,height/2),20,80);
  goal2 = new Goal(new PVector(width-10,height/2),20,500);
  player2 = new Player(new PVector(width-50,height/2),20,80);
  ss = new ScoreSystem(new PVector(100,50));
}

void draw(){
  background(255);
  hs.addHockey();
  hs.run();
  for(Wall w : walls){
    w.display();
  }
  goal1.display();
  player1.display();
  goal2.display();
  player2.display();
  ss.display();
  box2d.step();
  
  
  //println(hockeys.size());
}

void addWall(PVector pos,float wallWeight,float wallHeight){
  wall = new Wall(pos,wallWeight,wallHeight);
  walls.add(wall);
}

void beginContact(Contact cp){
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  if(o1.getClass() == Goal.class){
    Hockey h = (Hockey)o2;
    
    ss.increase1P();
    h.existFlag = true;
    
  }
  //println(o1.getClass());
  //println(o2.getClass());
  if(o1.getClass() == Goal.class){
    Hockey h = (Hockey)o2;
    if(h.getPosition().x < width/2){
      ss.increase1P();
    }else{
      ss.increase2P();
    }
    h.existFlag = true;
  }
  if(o2.getClass() == Goal.class){
    Hockey h = (Hockey)o1;
    if(h.getPosition().x < width/2){
      ss.increase1P();
    }else{
      ss.increase2P();
    }
    h.existFlag = true;
  }
}

// Objects stop touching each other
void endContact(Contact cp) {
}

void mousePressed(){
  saveFrame("*.png");
}
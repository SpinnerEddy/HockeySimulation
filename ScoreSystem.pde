class ScoreSystem{
  int scoreCount1;
  int scoreCount2;
  PVector position;
  
  ScoreSystem(PVector pos){
    position = pos;
    scoreCount1 = 0;
    scoreCount2 = 0;
  }
  
  void display(){
    fill(255);
    textSize(30);
    textAlign(CENTER);
    text("Goal1 : " + scoreCount1,position.x,position.y);
    text("Goal2 : " + scoreCount2,width-position.x,height-position.y);
  }
  
  void increase1P(){
    scoreCount1++;
  }
  void increase2P(){
    scoreCount2++;
  }
}
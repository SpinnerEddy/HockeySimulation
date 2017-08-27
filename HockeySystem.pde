class HockeySystem{
  ArrayList<Hockey> hockeys;
  PVector position;
  
  HockeySystem(PVector pos){
    position = pos;
    hockeys = new ArrayList<Hockey>();
  }
  
  void run(){
    for(int i = hockeys.size()-1; i >= 0; i--){
      hockeys.get(i).display();
      if(hockeys.get(i).done()){
        hockeys.remove(i);
      }
    }
  }
  
  void addHockey(){
    if(hockeys.size() <= 10){
      hockeys.add(new Hockey(position,random(255)));
    }
  }
  
}
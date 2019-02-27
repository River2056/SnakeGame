class SnakeBody {
  ArrayList<Snake> snakes;
  
  public SnakeBody(int scl) {
    snakes = new ArrayList<Snake>();
    snakes.add(new Snake(scl));
    snakes.add(new Snake(scl));
  }
  
  void updateHead() {
    Snake head = snakes.get(0);
    head.update();
    head.checkEdge();
  }
  
  void updateBody() {
    for(int i = snakes.size() - 1 ; i > 0 ; i--) {
        Snake frontTail = snakes.get(i - 1);
        Snake backTail = snakes.get(i);
        backTail.loc.x = frontTail.loc.x;
        backTail.loc.y = frontTail.loc.y;
      }
  }
  
  void move(int num) {
    Snake head = snakes.get(0);
    switch(num) {
      case UP:
        head.xSpeed = 0;
        head.ySpeed = -1;
        break;
      case DOWN:
        head.xSpeed = 0;
        head.ySpeed = 1;
        break;
      case LEFT:
        head.xSpeed = -1;
        head.ySpeed = 0;
        break;
      case RIGHT:
        head.xSpeed = 1;
        head.ySpeed = 0;
        break;
    }
  }
  
  boolean eat(Food f) {
    Snake head = snakes.get(0);
    int d = (int)dist(head.loc.x, head.loc.y, f.loc.x, f.loc.y);
    if(d < head.scl) {
      snakes.add(new Snake(head.scl));
      return true;
    } else {
      return false;
    }
  }
  
  boolean death() {
    
    for(int i = snakes.size() - 1 ; i > 1 ; i--) {
      Snake head = snakes.get(0);
      Snake s = snakes.get(i);
      int dead = (int)dist(head.loc.x, head.loc.y, s.loc.x, s.loc.y);
      if(dead < 1) {
        snakes.clear();
        snakes.add(new Snake(s.scl));
        snakes.add(new Snake(s.scl));
        return true;
      }
    }
    return false;
  }
  
  void display() {
    fill(255);
    for(Snake s : snakes) {
      rect(s.loc.x, s.loc.y, s.scl, s.scl);
    }
  }
  
}

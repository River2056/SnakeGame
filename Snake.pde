class Snake {
  private PVector loc;
  private int xSpeed, ySpeed, scl;
  
  public Snake(int scl) {
    loc = new PVector(0, 0);
    xSpeed = 1;
    ySpeed = 0;
    this.scl = scl;
  }
  
  void update() {
    loc.x += xSpeed * scl;
    loc.y += ySpeed * scl;
  }
  
  void display() {
    fill(255);
    rect(loc.x, loc.y, scl, scl);
  }
  
  void checkEdge() {
    if(loc.x + scl > WIDTH) {
      loc.x = 0;
    } else if(loc.x < -scl) {
      loc.x = WIDTH;
    }
    
    if(loc.y + scl > HEIGHT) {
      loc.y = 0;
    } else if(loc.y < -scl) {
      loc.y = HEIGHT;
    }
    
  }
  
  
  
  
}

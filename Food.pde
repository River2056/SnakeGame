class Food {
  private PVector loc;
  int scl;
  
  public Food(int scl) {
    this.scl = scl;
    loc = new PVector(
      int(random(WIDTH / scl)),
      int(random(HEIGHT / scl))
    );
    loc.mult(scl);
  }
  
  void display() {
    fill(255, 100, 100);
    rect(loc.x, loc.y, scl, scl);
  }
  
}

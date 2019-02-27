public static final int WIDTH = 800;
public static final int HEIGHT = 600;
public static final int UP = 0;
public static final int DOWN = 1;
public static final int LEFT = 2;
public static final int RIGHT = 3;
public int scl = 20;
int score = 0;

SnakeBody s;
Food f;

void keyPressed() {
  if(key == 'w' || key == 'W') {
    s.move(0);
  } else if(key == 's' || key == 'S') {
    s.move(1);
  } else if(key == 'a' || key == 'A') {
    s.move(2);
  } else if(key == 'd' || key == 'D') {
    s.move(3);
  }
}

void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  s = new SnakeBody(scl);
  f = new Food(scl);
}

void draw() {
  frameRate(10);
  background(0);
  s.updateHead();
  s.updateBody();
  s.display();
  f.display();
  if(s.eat(f)) {
    score++;
    f = new Food(scl);
  }
  if(s.death()) {
    score = 0;
  }
  
  fill(255);
  text("SCORE : " + score, WIDTH / 2 , 30);
  textSize(24);
  textAlign(CENTER);
  
}

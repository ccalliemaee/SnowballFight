class Player {
  // variables

  int x;
  int y;

  int w;
  int h;

  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isMovingUp;
  boolean isMovingDown;

  int left;
  int right;
  int top;
  int bottom;

  int speed;
  
  int isAlive;

  //constructor
  Player(int startingX, int startingY, int startingW, int startingH) {
    // initialize
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;

    isMovingLeft = false;
    isMovingRight = false;
    isMovingUp = false;
    isMovingDown = false;
    
    isAlive = 3;

    speed = 10;
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

  //functions
  void render() {
    if (isAlive == 0){
      return;
       }
    rectMode(CENTER);
    rect(x, y, w, h);
    
  }
  void move() {
    if (isMovingLeft == true && x > w/2) {
      x -= speed;
    }

    if (isMovingRight == true && x < width - w/2) {
      x += speed;
    }
    if (isMovingUp == true && y > h/2) {
      y -= speed;
    }
    if (isMovingDown == true && y < height - h/2) {
      y += speed;
    }
    // hit box moves with player
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }

void shoot(){
  // shoot snowballs
  if (y > height/2){ 
  snowballList.add(new Snowball(this.x, this.y - this.h/2, true));
  }
  else {
   snowballList.add(new Snowball(this.x, this.y + this.h/2, false)); 
  }
  
}





}
 

 

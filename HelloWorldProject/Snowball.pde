class Snowball {
  // variables
  int x;
  int y;
  int d;
  int speed;

  boolean shouldRemove;
  boolean shouldMoveUp;

  int left;
  int right;
  int top;
  int bottom;
  
  

  // constructor
  Snowball(int startingX, int startingY, boolean startingShouldMoveUp) {
   // initialize
    x = startingX;
    y = startingY;
    shouldMoveUp = startingShouldMoveUp;

    d = 15;

    speed = 15;

    shouldRemove = false;

    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }

  void render() {
    circle(x, y, d);
  }

  void move() {
    // snowball movement
    if (shouldMoveUp == true) {
      y -= speed;
    } else {
      y += speed;
    } 
    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }

  void checkRemove() {
    if (y < 0) {
      shouldRemove = true;
    }
  }



void hitPlayer(Player aPlayer) {
    // if bullet collides w enemy
  if (top <= aPlayer.bottom && 
      bottom >= aPlayer.top &&
      left <= aPlayer.right &&
      right >= aPlayer.left) {
      shouldRemove = true;
      explodeSound.play();
      aPlayer.isAlive -= 1;
    }
      
    }
    
void hitObstacle(Obstacle anObstacle) {
    // if bullet collides w enemy
  if (top <= anObstacle.bottom && 
      bottom >= anObstacle.top &&
      left <= anObstacle.right &&
      right >= anObstacle.left) {
      shouldRemove = true;
      explodeSound.play();
    }
      
    }    

  }

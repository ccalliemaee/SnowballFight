class Obstacle {
  // variables
  int x; 
  int y;
  int w;
  int h;
  
  int left;
  int right;
  int top;
  int bottom;
  
  Animation obstacleAnimation;
  
  // constructor
  Obstacle(int startingX, int startingY, int startingW, int startingH, Animation startingAnimation){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    obstacleAnimation = startingAnimation;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    
    
  }
  
  void render(){
    rectMode(CENTER);
    //rect(x,y,w,h);
   obstacleAnimation.display(x,y);
    
  }
  
  void playerCollide(Player aPlayer){
    // check to see if player is colliding and coming from the left
    if (aPlayer.top <= bottom &&
    aPlayer.bottom >= top &&
    aPlayer.right >= left &&
    aPlayer.left <= left){
      aPlayer.isMovingRight = false;
      aPlayer.x = left - aPlayer.w/2;
    }
    // check to see if the player is colliding and coming from the right
    if(aPlayer.top <= bottom &&
    aPlayer.bottom >= top &&
    aPlayer.left < right &&
    aPlayer.right >= right){
      aPlayer.isMovingLeft = false;
       aPlayer.x = right + aPlayer.w/2;
    }
    // check to see if the player is colliding and coming from the top
    if(aPlayer.left <= right &&
    aPlayer.right >= left &&
    aPlayer.bottom > top &&
    aPlayer.top <= top){
      aPlayer.isMovingDown = false;
      aPlayer.y = top - aPlayer.h/2;
    }
     // check to see if the player is colliding and coming from the bottom
     if(aPlayer.left <= right &&
     aPlayer.right >= left &&
     aPlayer.top < bottom &&
     aPlayer.bottom >= bottom){
       aPlayer.isMovingUp = false;
       aPlayer.y = bottom + aPlayer.h/2;
     }
    
    
    
    
  }
  
  
}

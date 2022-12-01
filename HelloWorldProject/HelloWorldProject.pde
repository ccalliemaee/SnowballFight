import processing.sound.*;
// i commented out player 2 and adjusted where needed bc player2 class was pointless.
// declaring my variables
Player p1;
Player p2;

Obstacle o1;
Obstacle o2;
Obstacle o3;
Obstacle o4;
Obstacle o5;
Obstacle o6;


ArrayList<Obstacle> obstacleList1;
ArrayList<Obstacle> obstacleList2;
ArrayList<Obstacle> obstacleList3;

SoundFile explodeSound;
SoundFile songg;

ArrayList<Snowball> snowballList;

int state = 0;

PImage snowImg;
PImage startImg;
PImage endImg;
PImage endtwoImg;
PImage[] girlImages = new PImage [2];
PImage[] obstacleImages = new PImage [1];
Animation girlAnimation;
Animation obstacleAnimation;

// current score of players
int p1Score = 0;
int p2Score = 0;

//score positions
int p1ScoreX = 190;
int p1ScoreY = 120;
int p2ScoreX = 880;
int p2ScoreY = 120;

//winning score
int winScore = 3;


void setup() {
  size(1200, 800);

  // initialize my vars
  p1 = new Player(width/2, height - 50, 50, 50);

  p2 = new Player(300, 400, 50, 50);

  snowballList = new ArrayList<Snowball>();

  songg = new SoundFile(this, "songg.mp3");
  explodeSound = new SoundFile(this, "explode.wav");
  explodeSound.play();
  explodeSound.amp(0.2);
  explodeSound.rate(3.0);





  startImg = loadImage("start.png");
  snowImg = loadImage("snow.jpeg");
  endImg = loadImage("end.png");
  endtwoImg = loadImage("endtwo.png");

  for (int i=0; i<girlImages.length; i++) {
    girlImages[i] = loadImage("girl" + str(i) + ".png");
  }
  girlAnimation = new Animation(girlImages, 0.1, 5.0);
  girlAnimation.isAnimating = true;


  for (int i=0; i<obstacleImages.length; i++) {
    obstacleImages[i] = loadImage("obstacle" + str(i) + ".png");
  }
  obstacleAnimation = new Animation(obstacleImages, 4.0, 4);
  o1 = new Obstacle(800, 600, 100, 100, obstacleAnimation);
  o2 = new Obstacle(200, 200, 100, 100, obstacleAnimation);
  o3 = new Obstacle(900, 200, 100, 100, obstacleAnimation);
  o4 = new Obstacle(200, 700, 100, 100, obstacleAnimation);
  o5 = new Obstacle(600, 200, 100, 100, obstacleAnimation);
  o6 = new Obstacle (300, 400, 100, 100, obstacleAnimation);

  obstacleList1 = new ArrayList<Obstacle>();

  obstacleList1.add(o1);
  obstacleList1.add(o2);
  obstacleList1.add(o3);

  obstacleList2 = new ArrayList<Obstacle>();

  obstacleList2.add(o4);
  obstacleList2.add(o5);

  obstacleList3 = new ArrayList<Obstacle>();

  obstacleList3.add(o6);
}





void draw() {
  println(state);
  switch (state) {
  case 0:
    background(startImg);
    startImg.resize(startImg.width, startImg.height);
    break;
  case 1:
    background(snowImg);
    snowImg.resize(snowImg.width, snowImg.height);

    if (songg.isPlaying() == false) {
      songg.play();
    }

    //p1.render();
    p1.move();
    //p2.render();
    p2.move();
    girlAnimation.isAnimating = true;
    girlAnimation.display(p1.x, p1.y);
    girlAnimation.display(p2.x, p2.y);
    obstacleAnimation.isAnimating = true;
    //obstacleAnimation.display(o1.x, o1.y);
    //for loop to go through everything inside obstaclelist
    for ( Obstacle anObstacle : obstacleList1) {
      //anObstacle.render();
      obstacleAnimation.display(anObstacle.x, anObstacle.y);
      anObstacle.playerCollide(p1);
      anObstacle.playerCollide(p2);
    }
    //for(int i = Obstacle.size()-1; i >=0; i=i-1){
    //  Obstacle anObstacle = Obstacle.get(i);

    //}
    // for loop that goes through all snowballs
    for (Snowball aSnowball : snowballList) {
      aSnowball.render();
      aSnowball.move();
      aSnowball.checkRemove();
      aSnowball.hitPlayer(p2);
      aSnowball.hitPlayer(p1);
      for ( Obstacle anObstacle : obstacleList1) {
        aSnowball.hitObstacle(anObstacle);
      }
    }

    // for loop removes unwanted snowballs
    for (int i = snowballList.size()-1; i >= 0; i -=1) {
      Snowball aSnowball = snowballList.get(i);
      if (aSnowball.shouldRemove == true) {
        snowballList.remove(aSnowball);
      }

      if (p1.isAlive == 0 || p2.isAlive == 0) {
        if (p1.isAlive == 0) {
          p2Score ++;
        }
        if (p2.isAlive == 0) {
          p1Score ++;
        }
        println("dead");
        state = 2;
        p1.isAlive = 3;
        p2.isAlive = 3;
      }
    }
    drawScore(p1Score, p1ScoreX, p1ScoreY, color(255));
    drawScore(p2Score, p2ScoreX, p2ScoreY, color(255));
    break;
  case 2:
    background(snowImg);
    snowImg.resize(snowImg.width, snowImg.height);

    if (songg.isPlaying() == false) {
      songg.play();
    }

    //p1.render();
    p1.move();
    //p2.render();
    p2.move();
    girlAnimation.isAnimating = true;
    girlAnimation.display(p1.x, p1.y);
    girlAnimation.display(p2.x, p2.y);
    obstacleAnimation.isAnimating = true;
    //obstacleAnimation.display(o1.x, o1.y);
    //for loop to go through everything inside obstaclelist
    for ( Obstacle anObstacle : obstacleList2) {
      //anObstacle.render();
      obstacleAnimation.display(anObstacle.x, anObstacle.y);
      anObstacle.playerCollide(p1);
      anObstacle.playerCollide(p2);
    }
    //for(int i = Obstacle.size()-1; i >=0; i=i-1){
    //  Obstacle anObstacle = Obstacle.get(i);

    //}
    // for loop that goes through all snowballs
    for (Snowball aSnowball : snowballList) {
      aSnowball.render();
      aSnowball.move();
      aSnowball.checkRemove();
      aSnowball.hitPlayer(p2);
      aSnowball.hitPlayer(p1);

      for ( Obstacle anObstacle : obstacleList2) {
        aSnowball.hitObstacle(anObstacle);
      }
    }

    // for loop removes unwanted snowballs
    for (int i = snowballList.size()-1; i >= 0; i -=1) {
      Snowball aSnowball = snowballList.get(i);
      if (aSnowball.shouldRemove == true) {
        snowballList.remove(aSnowball);
      }

      if (p1.isAlive == 0 || p2.isAlive == 0) {
        if (p1.isAlive == 0) {
          p2Score ++;
        }
        if (p2.isAlive == 0) {
          p1Score ++;
        }
        println("dead");
        state = 3;
        p1.isAlive = 3;
        p2.isAlive = 3;
      }
    }
    drawScore(p1Score, p1ScoreX, p1ScoreY, color(255));
    drawScore(p2Score, p2ScoreX, p2ScoreY, color(255));
    break;
  case 3:
    background(snowImg);
    snowImg.resize(snowImg.width, snowImg.height);

    if (songg.isPlaying() == false) {
      songg.play();
    }

    //p1.render();
    p1.move();
    //p2.render();
    p2.move();
    girlAnimation.isAnimating = true;
    girlAnimation.display(p1.x, p1.y);
    girlAnimation.display(p2.x, p2.y);
    obstacleAnimation.isAnimating = true;

    //for loop to go through everything inside obstaclelist
    for ( Obstacle anObstacle : obstacleList3) {
      //anObstacle.render();
      obstacleAnimation.display(anObstacle.x, anObstacle.y);
      anObstacle.playerCollide(p1);
      anObstacle.playerCollide(p2);
    }
    //for(int i = Obstacle.size()-1; i >=0; i=i-1){
    //  Obstacle anObstacle = Obstacle.get(i);

    //}
    // for loop that goes through all snowballs
    for (Snowball aSnowball : snowballList) {
      aSnowball.render();
      aSnowball.move();
      aSnowball.checkRemove();
      aSnowball.hitPlayer(p2);
      aSnowball.hitPlayer(p1);
      for ( Obstacle anObstacle : obstacleList3) {
        aSnowball.hitObstacle(anObstacle);
      }
    }

    // for loop removes unwanted snowballs
    for (int i = snowballList.size()-1; i >= 0; i -=1) {
      Snowball aSnowball = snowballList.get(i);
      if (aSnowball.shouldRemove == true) {
        snowballList.remove(aSnowball);
      }

      if (p1.isAlive == 0 || p2.isAlive == 0) {
        println("game over");
        if (p1.isAlive == 0) {
          p2Score ++;
        }
        if (p2.isAlive == 0) {
          p1Score ++;
        }
        state = 4;
      }
    }
    drawScore(p1Score, p1ScoreX, p1ScoreY, color(255));
    drawScore(p2Score, p2ScoreX, p2ScoreY, color(255));
    break;
  case 4:

    if (p1Score > p2Score) {
      background(endImg);
      endImg.resize(startImg.width, startImg.height);
    }
    if (p2Score > p1Score){
      background(endtwoImg);
      endtwoImg.resize(startImg.width, startImg.height);
    }

    break;
  }
}

void drawScore(int score, int x, int y, color aColor) {
  fill(aColor);
  textSize(110);
  text(score, x, y);
}

// movement of players
void keyPressed() {
  if (key =='a') {
    p1.isMovingLeft = true;
  }
  if (key == 'd') {
    p1.isMovingRight = true;
  }
  if (key == 'w') {
    p1.isMovingUp = true;
  }
  if (key == ' ') {
    p1.shoot();
  }
  if (key =='j') {
    p2.isMovingLeft = true;
  }
  if (key == 'l') {
    p2.isMovingRight = true;
  }
  if (key == 'i') {
    p2.isMovingUp = true;
  }
  if (key == 'k') {
    p2.isMovingDown = true;
  }
  if (key == 'u') {
    p2.shoot();
  }
  if (key == 's') {
    if (state == 0) {
      state = 1;
    } else {
      p1.isMovingDown = true;
    }
  }
}

void keyReleased() {
  if (key =='a') {
    p1.isMovingLeft = false;
  }
  if (key == 'd') {
    p1.isMovingRight = false;
  }
  if (key == 'w') {
    p1.isMovingUp = false;
  }
  if (key == 's') {
    p1.isMovingDown = false;
  }
  if (key =='j') {
    p2.isMovingLeft = false;
  }
  if (key == 'l') {
    p2.isMovingRight = false;
  }
  if (key == 'i') {
    p2.isMovingUp = false;
  }
  if (key == 'k') {
    p2.isMovingDown = false;
  }
}

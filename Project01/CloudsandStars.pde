class Star {
  float starSize;
  float x;
  float y;

  Star() {
    starSize = random(5, 12);
    x = random(800);
    y = random(500);
  }

  void generateStar() {
    fill(255, random(50, 150));
    noStroke();
    ellipse(x, y, starSize, starSize);
  }

  void newStars() {
    x = random(800);
    y = random(400);
  }
}

class Cloud {
  float cloudX;
  float cloudY;
  float cloudWidth;
  float cloudHeight;
  float randVal;
  float cloudSpeed;

  Cloud() {
    cloudX = random(width);
    cloudY = random(0, 200);
    cloudWidth = random(50, 80);
    cloudHeight = random (10, 100);
    randVal = random(30, 100);
    cloudSpeed = random(1, 3);
  }

  void displayClouds() {
    noStroke();
    fill(255, randVal);
    rect(cloudX, cloudY, cloudWidth, cloudHeight);
  }

  void newClouds() {
    cloudX = random(width);
    cloudY = random(0, 200);
    cloudWidth = random(50, 80);
    cloudHeight = random (10, 100);
    randVal = random(50, 100);
  }

  void moveClouds() {
    cloudX = cloudX + cloudSpeed;
  }

  void cloudBoundries() {
    if (cloudX > width + 200 || cloudX < -200) {
      cloudSpeed = cloudSpeed * -1;
    }
  }

  void run() {
    displayClouds(); //draw the clouds 
    moveClouds(); //moves the clouds by increasing the x values
    cloudBoundries(); //checks when to move clouds in the opposite direction by decreasing the x values
  }
}

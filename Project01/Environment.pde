class Sun {
  float sunLightX = 100;
  float sunLightY = 100;
  float shineAmount = 50;
  float shineIncrement = 1;
  boolean morning;

  void checkMorning() {
  }

  void sunRise() {
    if (mouseX > width/2 + 200) { //calls moveSun() function when the mouse pointer is on the right side of the window
      moveSun();
      if (sunY < 600) {
        morning = true;
      }
      //println(morning);
    }
  }

//moves sun up by 5 and moon down by 5 using their y values
  void moveSun() { 
    sunY = sunY - 5;
    moonY = moonY + 5;
  }
  
//checks when to stop the sun from rising
  void checkRisen() { 
    if (sunY < 100) {
      stopRising();
    }
  }

//stops sun from rising and stops moon from setting
  void stopRising() { 
    sunY = 100;
    moonY = 800;
  }

//draws sun 
  void display() { 
    fill(255, 228, 132, shineAmount);
    noStroke();
    ellipse(700, sunY, sunLightX, sunLightY);
    fill(255, 228, 132);
    noStroke();
    ellipse(700, sunY, 80, 80);
  }

  void sunLight() { //code taken from my excersise 2
    if (sunLightX != -100) { //expands the emitted light when the width is not -220
      sunLightX = sunLightX + 1;
      sunLightY = sunLightY + 1;
      shineAmount = shineAmount + shineIncrement; //increases or decreases the opacity of the light circle as it changes size by shineIncrement which is either 1 or -1
    } else {              //resets width and height of the lighter circle to positive 220 when the width is -220
      sunLightX = sunLightX * -1;
      sunLightY = sunLightY * -1;
      shineIncrement = 1;
    }
    if (sunLightX > 150) { //decreases width and height of the lighter circle  
      sunLightX = sunLightX * -1;
      sunLightY = sunLightY * -1;
      shineIncrement = -1;
    }
  }
}

class Moon {
  float moonLightX = 100;
  float moonLightY = 100;
  float shineAmount = 50;
  float shineIncrement = 1;

  void moonRise() { 
    if (mouseX < width/2 - 200) {
      moveMoon();
      if (moonY < 600) {
        sun.morning = false;
      }
    }
  }

//moves moon up by 5 and sun down by 5
  void moveMoon() { 
    moonY = moonY - 5;
    sunY = sunY + 5;
  }

//stops moon from rising and stops sun from setting
  void stopRising() { 
    moonY = 100;
    sunY = 800;
  }
  
//checks when to stop the moon from rising
  void checkRisen() { 
    if (moonY < 100) {
      stopRising();
    }
  }

  void display() { 
    fill(250, 241, 193, shineAmount);
    noStroke();
    ellipse(100, moonY, moonLightX, moonLightY);
    fill(250, 241, 193);
    noStroke();
    ellipse(100, moonY, 80, 80);
  }

  void moonLight() { //code taken from my excersise 2
    if (moonLightX != -100) { //expands the emitted light when the width is not -220
      moonLightX = moonLightX + 1;
      moonLightY = moonLightY + 1;
      shineAmount = shineAmount + shineIncrement; //increases or decreases the opacity of the light circle as it changes size by shineIncrement which is either 1 or -1
    } else {              //resets width and height of the lighter circle to positive 220 when the width is -220
      moonLightX = moonLightX * -1;
      moonLightY = moonLightY * -1;
      shineIncrement = 1;
    }
    if (moonLightX > 150) { //decreases width and height of the lighter circle  
      moonLightX = moonLightX * -1;
      moonLightY = moonLightY * -1;
      shineIncrement = -1;
    }
  }
}

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
}

class Sky {
  color col;
  color newCol;
  float lerpSpeed;

  Sky() {
    lerpSpeed =  1;
  }

  void run() {
    float r = map(moonY, 0, width, 111, 147);
    float g = map(moonY, 0, width, 114, 179);
    float b = map(moonY, 0, width, 151, 207);
    newCol = color(r, g, b, 100);

    col = lerpColor(col, newCol, lerpSpeed);
    background(col);
  }
}

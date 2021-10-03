class Berry {
  float x;
  float y;
  float sizeVal;
  float increment;
  float dropSpeed;
  boolean picked;

  Berry() {
    sizeVal = random(10, 25);
    x = random(150) + 325;
    y = random(150) + 400;
    increment = 0;
    dropSpeed = 5;
  }

  void position() {
    fill(berryColor);
    stroke(0);
    strokeWeight(5);
    ellipse(x, y, 0 + increment, 0 + increment);
  }

  void grow() {
    if (increment < sizeVal) {
      increment = increment + 1;
    }
  }

  void pick() {
    y = y + dropSpeed;
  }

  void movePos() {
    x = random(150) + 325;
    y = random(150) + 400;
    increment = 0;
    berryColor = color(random(255), random(255), random(255));
  }

  void checkDistance() {
    float d = dist(x, y, mouseX, mouseY);
    if (d < 50) {
      picked = true;
      println(picked);
    }
  }

  void fall() {
    if (picked == true && y < height + 30) {
      dropSpeed = int(random(3, 8));
      pick();
    } else {
      picked = false;
    }
  }
}

class Animal {
  PVector berryPosition;
  int berryChoice;
  boolean isHungry = false;
  float animalX;
  float animalY;
  float animalSpeed;
  float animalVal;

  Animal() {
    animalX = width/2;
    animalY = 400;
    animalSpeed = 5;
    animalVal = 100;
  }

  boolean overlaps(Berry other) {
    float d = dist(animalX, animalY, other.x, other.y);
    if (d < animalVal + other.sizeVal) {
      return true;
    } else {
      return false;
    }
  }

  void pickBerry() {
    berryChoice = int(random(berries.length));
    if (berries[berryChoice].sizeVal > 0) {
      moveTo();
    }
  }
  void moveTo() {
    animalX = berries[berryChoice].x;
    animalY = berries[berryChoice].y;
  }
  void eatBerry() {
  }

  void animal() {
    noStroke();
    fill(233, 44, 69);
    ellipse(animalX, animalY, animalVal, animalVal);
  }

  void moveAnimal() {
    animalX = animalX + animalSpeed;
  }

  void checkAnimal() {
    if (animalX > width || animalX < 0) {
      animalSpeed = animalSpeed * -1;
    }
  }
}

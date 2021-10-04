class Plant {

  PImage currentPlant, pot, plant1, plant2, plant3, plant4;
  PImage currentFace, smile, happy, reallyHappy, smiley, sleep, nervous, sad;
  int counter = 0;

  Plant() {
    pot = loadImage("pot2.png");
    plant1 = loadImage("plantphase1.png");
    plant2 = loadImage("plantphase2.png");
    plant3 = loadImage("plantphase3.png");
    plant4 = loadImage("plantphase4.png");

    smile = loadImage("smile2.png");
    happy = loadImage("happy.png");
    reallyHappy = loadImage("reallyhappy.png");
    smiley = loadImage("smiley.png");
    sleep = loadImage("sleep.png");
    nervous = loadImage("nervous.png");
    sad = loadImage("sad.png");

    currentPlant = pot;
    currentFace = pot;
  }

  void update() {
    if (currentPlant == plant4 && sunY == 100) { //plant changes face to really happy automatically when the sun reaches its max point
      currentFace = reallyHappy;
    }
    if (currentPlant == plant4 && moonY == 100) { //plant goes to sleep automatically when the moon reaches its max point
      currentFace = sleep;
    }
  }

  void draw() {
    image(currentPlant, 0, 0); //displays current plant 
    image(pot, 0, 0); //displays pot
    image(currentFace, 0, 0); //displays face
  }

  void clicked() {
    if (sun.morning && sunY == 100) { //when it's morning every click updates the plant and its face until it is full grown
      if (counter == 0) {
        currentPlant = plant1;
        counter = counter + 1;
        currentFace = smile;
      } else if (counter == 1) {
        currentPlant = plant2;
        counter = counter + 1;
        currentFace = smiley;
      } else if (counter == 2) {
        currentPlant = plant3;
        counter = counter + 1;
        currentFace = happy;
      } else if (counter == 3) {
        currentPlant = plant4;
        currentFace = reallyHappy;
      }
    } 
    if (!sun.morning && moonY == 100) { //when the mouse is clicked during the night, the plant shrinks and gets sad the smaller it gets
      if (counter == 3) {
        currentPlant = plant3;
        currentFace = sleep;
        counter = counter - 1;
      } else if (counter == 2) {
        currentPlant = plant2;
        currentFace = nervous;
        counter = counter - 1;
      } else if (counter == 1) {
        currentPlant = plant1;
        currentFace = sad;
        counter = counter - 1;
      } else if (counter == 0) {
        currentPlant = pot;
        currentFace = pot;
      }
    }
    println(counter);
  }

  void run() {
    update();
    draw();
  }
}

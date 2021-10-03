Sun sun;
Moon moon;
Animal a1;
Cloud[] clouds = new Cloud[20];
Star[] stars = new Star[30];
Berry[] berries = new Berry[20];
PImage currentPlant, pot, plant1, plant2, plant3, plant4;
PImage currentFace, smile, happy, reallyHappy, smiley, sleep, nervous, sad;
int counter = 0;
float sunY = 100;
float moonY = 800;
float fallSpeed = 5;
color berryColor;

void setup() {
  size(800, 800);

  for (int i = 0; i < berries.length; i = i + 1) {
    berries[i] = new Berry();
  }

  for (int i = 0; i < stars.length; i = i + 1) {
    stars[i] = new Star();
  }

  for (int i = 0; i < clouds.length; i = i + 1) {
    clouds[i] = new Cloud();
  }

  sun = new Sun();
  moon = new Moon();
  a1 = new Animal();


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
  rectMode(CENTER);
}

void timeOfDay() {
  if (!sun.morning) {
    background(111, 114, 151);
  }
}

void draw() {
  background (147, 179, 207);

  timeOfDay();

  for (int i = 0; i < clouds.length; i = i + 1) {
    if (sun.morning) {
      clouds[i].displayClouds();
      clouds[i].moveClouds();
      clouds[i].cloudBoundries();
    } else {
      clouds[i].newClouds();
    }
  }

  for (int i = 0; i < stars.length; i = i + 1) {
    if (!sun.morning) {
      stars[i].generateStar();
    } else {
      stars[i].newStars();
    }
  }

  sun.display();
  sun.sunRise();
  sun.sunLight();
  sun.checkRisen();

  moon.display();
  moon.moonRise();
  moon.moonLight();
  moon.checkRisen();

  strokeWeight(3);
  fill(255, 223, 211);
  rect(width/2, 750, width, 100); //table

  image(currentPlant, 0, 0); //current plant display
  image(pot, 0, 0); //displays pot
  image(currentFace, 0, 0); //displays face

  for (int i = 0; i < berries.length; i = i + 1) {
    if (currentPlant == plant4) {
      berries[i].position();
      berries[i].grow();
      berries[i].checkDistance();
      berries[i].fall();
      //a1.pickBerry();
      //if (a1.overlaps(berries[a1.berryChoice])) {
      //berries[a1.berryChoice].fall();
      //}
    } else {
      berries[i].movePos();
    }
  }

  //a1.moveAnimal();
  //a1.animal();
  //a1.checkAnimal();
}
void mousePressed() {
  if (sun.morning) {
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
  if (moonY == 100) {
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

Plant plant;
Sun sun;
Moon moon;
Animal a1;
Cloud[] clouds = new Cloud[20];
Star[] stars = new Star[30];
Berry[] berries = new Berry[20];

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
  plant = new Plant();
  a1 = new Animal();

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

  for (int i = 0; i < clouds.length; i = i + 1) { //creates clouds in the morning and new clouds at new positiions during night time
    if (sun.morning) {
      clouds[i].displayClouds(); //draw the clouds 
      clouds[i].moveClouds(); //moves the clouds by increasing the x values
      clouds[i].cloudBoundries(); //checks when to move clouds in the opposite direction by decreasing the x values
    } else {
      clouds[i].newClouds(); //refreshes all of the values for the clouds, including the size and x and y values
    }
  }

  for (int i = 0; i < stars.length; i = i + 1) { //creates stars when it's not morning and refreshes their positions when it is
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
  rect(width/2, 750, width, 100); 

  plant.run(); //draws and updates the plant's phase and current face 

  for (int i = 0; i < berries.length; i = i + 1) { //creates berries when the plant is flly grown
    if (plant.currentPlant == plant.plant4) {
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
  plant.clicked();
}

Plant plant;
Sun sun;
Moon moon;
Sky sky;
Cloud[] clouds = new Cloud[20];
Star[] stars = new Star[30];
ArrayList<Berry> berries;

float sunY = 100;
float moonY = 800;
float fallSpeed = 5;
int numBerries = 15;
color berryColor = color(255, 127, 127);

void setup() {
  size(800, 800);

  berries = new ArrayList<Berry>();

  for (int i = 0; i < stars.length; i = i + 1) {
    stars[i] = new Star();
  }

  for (int i = 0; i < clouds.length; i = i + 1) {
    clouds[i] = new Cloud();
  }

  sun = new Sun();
  moon = new Moon();
  plant = new Plant();
  sky = new Sky();

  rectMode(CENTER);
}

void draw() {

  //changes background/sky color
  sky.run();

  //creates clouds in the morning and new clouds at new positiions during night time
  for (int i = 0; i < clouds.length; i = i + 1) { 
    if (sun.morning) {
      clouds[i].run();
    } else {
      clouds[i].newClouds(); //refreshes all of the values for the clouds, including the size and x and y values
    }
  }

  //creates stars when it's not morning and refreshes their positions when it is
  for (int i = 0; i < stars.length; i = i + 1) { 
    if (!sun.morning) {
      stars[i].generateStar(); //creates stars
    } else {
      stars[i].newStars(); //repositions stars
    }
  }
  //displays and moves the sun a moon
  sun.run();
  moon.run();

  strokeWeight(3);
  fill(254, 220, 213);
  rect(width/2, 750, width, 100); 

  int s = second();
  println(s);
  //adds new berries every 5th seconds for each berry that was removed 
  for (int i = 0; i < numBerries; i++) {
    if (berries.size() < 20 && sun.morning) {
      if (s % 5 == 0) {   
        berries.add(new Berry());
      }
    }
  } 

  //draws and updates the plant's phase and current face 
  plant.run(); 

  //creates berries when the plant is fully grown
  for (int i = berries.size() - 1; i >= 0; i--) { 
    Berry b = berries.get(i);
    if (plant.currentPlant == plant.plant4) {
      b.run();
    } else {
      b.movePos(); //refreshes new berries next time plant is fully grown
    }
    if (b.isPicked()) {
      berries.remove(i);
    }
//!sun.morning && 
    if ((berries.size() <= 0) || plant.currentPlant == plant.plant3) {
      b.changeCol();
    }
  }
}

void mousePressed() {
  plant.changePlantPhase();
}

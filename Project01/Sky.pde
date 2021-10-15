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

// Code borrowed from
// http://www.complexification.net/gallery/machines/substrate/index.php
// j.tarbell   April, 2005

// Pallet parameters
int maxpal = 812;
int numpal = 0;
color[] goodcolor = new color[maxpal];
int size = 15;
int count;

void setup() {
  size(550, 600);
  noLoop();
}

void draw() {
  background(0);
  pickColourFromPallet("pallet.png");

  // show pallet colours
  for (int i = 0; i < 30; i ++) {
    for (int j = 0; j < maxpal / 30; j ++) {
      ellipse(size + (i * size), j * size + 170, size, size);  
      fill(goodcolor[count]);
      count ++;
    }
  }
}


void pickColourFromPallet(String fn) {
  PImage b;
  b = loadImage(fn);
  image(b, 0, 0);

  for (int x=0; x<b.width; x++) {
    for (int y=0; y<b.height; y++) {
      color c = get(x, y);
      boolean exists = false;
      for (int n=0; n<numpal; n++) {
        if (c==goodcolor[n]) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        // add color to pal
        if (numpal<maxpal) {
          goodcolor[numpal] = c;
          numpal++;
        }
      }
    }
  }
}

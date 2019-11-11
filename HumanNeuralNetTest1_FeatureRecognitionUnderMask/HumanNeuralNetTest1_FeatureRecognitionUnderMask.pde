/*
Author: Navin
Date: November 2019
License: MIT
This program serves to show how inadequate it is to expect a neural network use convolution to interpret the features in an image.
Since artificial neural networks are modeled on the human neural network, the challenge here is for a human to say at which mask size
they are able to recognize features in the image.
*/
PImage img;
int startY = 0;
int startX = 0;
int jump = 10;
int maskSize = 10;
  
void setup() {
  size(481, 321);
  img = loadImage("bear.jpg");
  setTitleToMaskSize();
  //delay(10000);//to start the screen recorder
}

void draw() {
  if (maskSize <= 100) {maskMovement();}
  else {
    frame.setTitle("Actual Image");
    image(img, 0, 0);
  }
}

void maskMovement() {
  delay(50);
  background(0,0,0);
  loadPixels(); 
  if (startX >= width-maskSize) {startX = 0; startY = startY + jump;}
  if (startY >= height-maskSize) {startY = 0; maskSize = maskSize + 10; setTitleToMaskSize();}  
  img.loadPixels(); 
  for (int y = startY; y < startY+maskSize; y++) {
    for (int x = startX; x < startX+maskSize; x++) {
      int loc = x + y*width;
      pixels[loc] =  color(red(img.pixels[loc]), green(img.pixels[loc]), blue(img.pixels[loc]));          
    }
  }
  startX = startX + jump;
  updatePixels();  
}

void setTitleToMaskSize() {
  frame.setTitle("Mask size: "+str(maskSize));
}

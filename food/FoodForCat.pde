import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<FoodForCat> food;
Box2DProcessing food2d;

  int rad = 60;        // Width of the shape
  float xpos, ypos;    // Starting position of shape    
  float xspeed = 2;    // Speed of the shape
  float yspeed = 0;    // Speed of the shape
  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom

 void settings() {
  size(1200, 720);
}
void setup(){
  settings();
  food2d = new Box2DProcessing(this);
  food2d.createWorld();
  food = new ArrayList<FoodForCat>();
  ///fishball
  //noStroke(); Stroke object
  fill(#7F00FF);
  frameRate(144);    //Hz moniter
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}
void draw(){
  background(255);
  food2d.step();
  
  if(mousePressed){
    FoodForCat pos = new FoodForCat(mouseX ,mouseY);
    food.add(pos);
}
  for(FoodForCat f: food){
    f.display();
  }
  fill(102);
  rect(0, 650, 1200, 63);
  // Update the position of the shape
  ypos =630;
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  fill(#7F00FF);
  ellipse(xpos, ypos, rad, rad);
}

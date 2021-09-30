class FoodForCat {
  Body food;
  float x,y;
  float w,h;
  
  FoodForCat(float mouse_x, float mouse_y){
    x=mouse_x;
    y=mouse_y;
    w=16;
    h=16;
    
    // Build body.
    BodyDef food_body = new BodyDef();
    food_body.type = BodyType.DYNAMIC;
    food_body.position.set(food2d.coordPixelsToWorld(mouseX,mouseY));
    food = food2d.createBody(food_body);

    // Build shape.
    PolygonShape food_shape = new PolygonShape();
    //Box2D considers the width and height of a rectangle to be the distance from the center to the edge (so half of what we normally think of as width or height).
    float food2dW = food2d.scalarPixelsToWorld(w/2);
    float food2dH = food2d.scalarPixelsToWorld(h/2);
    //[end]
    food_shape.setAsBox(food2dW, food2dH);

    FixtureDef feature = new FixtureDef();
    feature.shape = food_shape;
    feature.density = 1;
    // Set physics parameters.
    feature.friction = 0.3;
    feature.restitution = 0.5;

    // Attach the Shape to the Body with the Fixture.
    food.createFixture(feature);
 }
  
   void display() {
    //We need the Body’s location and angle.
    Vec2 pos = food2d.getBodyPixelCoord(food);
    float angle = food.getAngle();
    //[end]

    pushMatrix();
    //Using the Vec2 position and float angle to translate and rotate the rectangle
    translate(pos.x,pos.y);
    rotate(-angle);
    //[end]
    fill(175);
    stroke(0);
    rectMode(RADIUS);
    rect(0,0,w,h);
    popMatrix();
  }
  void delete_food(){
    food2d.destroyBody(food);
  }
}

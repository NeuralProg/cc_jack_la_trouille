class Orb {
  int orb_size = int(random(25, 50));
    
  int[] lines = {180, 300, 420, 540, 660};
  int line_number = int(random(0, 5));
  
  int position_x = 1250;
  int position_y = lines[line_number];
  
  color orb_color = color(int(random(150, 255)), 150, 0);
  
  int speed = int(random(2, 5));
  
  void display() {
    pushStyle();
    fill(orb_color);
    noStroke();
    circle(position_x, position_y, orb_size);
    popStyle();
  }
  void move() {
    position_x -= speed;
  }
  
  int is_alive (){
    int rtrn = 0;
    if (position_x < orb_size) {
      rtrn = 1; 
    }
     return rtrn;
  }
 }
  

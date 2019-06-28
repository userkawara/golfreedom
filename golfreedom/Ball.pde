class Ball{
  int current_stage = 0;
  int x, y, r = 30;
  int px, py;
  int dx, dy;
  float sx = 0, sy = 0;
  int out_loop = 1;
  float g = 0.1;
  float air_resistance = 0.997;
  boolean can_break = false;
  float can_break_criterion = 12;
  float max_velocity_of_shot = 15;
  float min_velocity = 1;
  boolean is_moving = true;
  boolean pressed = false;
  color col = color(255);
  
  void move(){
  }
  
  void display(Stage s){
  }
  
  void miss(Stage s, Block[][] bl, Uphill_45[][] uh, Downhill_45[][] dh, Bumper[][] bp){
  }

  void hit_corner(int x2, int y2, float rebound){
  }
}

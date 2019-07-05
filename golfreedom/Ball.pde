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
    if(is_moving){
      px = x;
      py = y;
      sy += g;
      sx = sx * air_resistance;
      sy = sy * air_resistance;
      x += sx;
      y += sy;
      if(can_break_criterion <= dist(0, 0, sx, sy)){
        can_break = true;
      }else{
        can_break = false;
      }
    }else{
      can_break = false;
    }
  }
  
  void display(Stage s){
    if(x < width/2){
      dx = x;
    }else if(x > s.w - width/2){
      dx = x - (s.w - width);
    }else{
      dx = width/2;
    }
    if(y < height/2){
      dy = y;
    }else if(y > s.h - height/2){
      dy = y - (s.h - height);
    }else{
      dy = height/2;
    }
    if(can_break){
      fill(255, 255, 0);
    }else{
      fill(col);
    }
    ellipse(dx, dy, r*2, r*2);
  }
  
  void update_current_stage(boolean clear, Stage[] s, Block[][] bl, Uphill_45[][] uh, Downhill_45[][] dh, Bumper[][] bp){
    if(clear){
      current_stage++;
      if(s.length <= current_stage){
        current_stage = 0;
      }
      reset(s[current_stage], bl, uh, dh, bp);
    }
  }
  
  void miss(Stage s, Block[][] bl, Uphill_45[][] uh, Downhill_45[][] dh, Bumper[][] bp){
    if(x+r < 0 || s.w < x-r || s.h < y-r){
      reset(s, bl, uh, dh, bp);
    }
  }
  
  void reset(Stage s, Block[][] bl, Uphill_45[][] uh, Downhill_45[][] dh, Bumper[][] bp){
    x = s.initial_x;
    y = s.initial_y;
    sx = 0;
    sy = 0;
    for(int i=0; i<s.count_block; i++){
      bl[current_stage][i].exist = true;
    }
    for(int i=0; i<s.count_uphill_45; i++){
      uh[current_stage][i].exist = true;
    }
    for(int i=0; i<s.count_downhill_45; i++){
      dh[current_stage][i].exist = true;
    }
    for(int i=0; i<s.count_bumper; i++){
      bp[current_stage][i].exist = true;
    }
    is_moving = true;
  }
  
  void hit_corner(int x2, int y2, float rebound){
  }
}

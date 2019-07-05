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
  
  void miss(Stage s, Block[][] bl, Uphill_45[][] uh, Downhill_45[][] dh, Bumper[][] bp){
  }

  void hit_corner(int x2, int y2, float rebound){
  }
}

class Block{
  int x, y, w, h;
  int dx, dy;
  float rebound = 0.3;
  float friction = 0.6;
  color col = random_color();
  boolean exist = true;
  
  Block(int x0, int y0, int w0, int h0){
    x=x0;
    y=y0;
    w=w0;
    h=h0;
  }
  
  void display(Ball b){
    fill(col);
    dx = x - b.x + b.dx;
    dy = y - b.y + b.dy;
    if(exist){
      stroke(0);
    rect(dx, dy, w, h);
    }
  }
  
  void hit(Ball b){
    if(exist){
      hit_upper_side(b);
      hit_lower_side(b);
      hit_left_side(b);
      hit_right_side(b);
      hit_corner(b);
    }
  }
  
  void hit_upper_side(Ball b){
    if ((b.y + b.r) >= y && x < b.x && b.x < x+w && b.y < y){
      b.y = b.py;
      b.sy = -b.sy * rebound;
      b.sx = b.sx * friction;
      if(dist(0, 0, b.sx, b.sy) < b.min_velocity){
        b.is_moving = false;
        b.sx = 0;
        b.sy = 0;
      }
      if(b.can_break){
        exist = false;
      }
    }
  }
  
  void hit_lower_side(Ball b){
    if ((b.y - b.r) <= y+h && x < b.x && b.x < x+w && y+h < b.y){
      b.y = b.py;
      b.sy = -b.sy * rebound;
      b.sx = b.sx * friction;
      if(b.can_break){
        exist = false;
      }
    }
  }
  
  void hit_left_side(Ball b){
    if ((b.x + b.r) >= x && y < b.y&& b.y < y+h && b.x < x){
      b.x = b.px;
      b.sx = -b.sx * rebound;
      b.sy = b.sy * friction;
      if(b.can_break){
        exist = false;
      }
    }
  }
  
  void hit_right_side(Ball b){
    if ((b.x - b.r) <= x + w && y < b.y&& b.y < y+h && x+w < b.x){
      b.x = b.px;
      b.sx = -b.sx * rebound;
      b.sy = b.sy * friction;
      if(b.can_break){
        exist = false;
      }
    }
  }
  
  void hit_corner(Ball b){
    if(dist(b.x, b.y, x, y) < b.r){
      b.hit_corner(x, y, rebound);
      b.sx -= b.out_loop;
      b.sy -= b.out_loop;
      if(b.can_break){
        exist = false;
      }
      return;
    }
    if(dist(b.x, b.y, x+w, y) < b.r){
      b.hit_corner(x+w, y, rebound);
      b.sx += b.out_loop;
      b.sy -= b.out_loop;
      if(b.can_break){
        exist = false;
      }
      return;
    }
    if(dist(b.x, b.y, x+w, y+h) < b.r){
      b.hit_corner(x+w, y+h, rebound);
      b.sx += b.out_loop;
      b.sy += b.out_loop;
      if(b.can_break){
        exist = false;
      }
      return;
    }
    if(dist(b.x, b.y, x, y+h) < b.r){
      b.hit_corner(x, y+h, rebound);
      b.sx -= b.out_loop;
      b.sy += b.out_loop;
      if(b.can_break){
        exist = false;
      }
      return;
    }
  }
}

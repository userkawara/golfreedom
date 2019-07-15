class Downhill_45{
  float ball_x2,ball_y2;
  int x,y,size;
  int dx,dy;
  float rebound = 0.3;
  float friction = 0.6;
  color col = color(0);
  boolean exist = true;
  
  Downhill_45(int x0, int y0, int size0){
    x = x0;
    y = y0;
    size = size0;
  }
  
  void display(Ball b){
    fill(col);
    dx = x - b.x + b.dx;
    dy = y - b.y + b.dy;
    if(exist == true){
      triangle(dx, dy, dx, dy+size, dx+size, dy+size);
    }
  }
  
  void hit(Ball b){
    if(exist){
      hit_oblique_side(b);
      hit_lower_side(b);
      hit_left_side(b);
      hit_corner(b);
    }
  }
  
  void hit_oblique_side(Ball b){
    ball_x2 = b.x-b.r*sqrt(2)/2;
    ball_y2 = b.y+b.r*sqrt(2)/2;
    if(x<ball_x2 && y<ball_y2 && ball_x2<x+size && ball_y2<y+size && ball_y2 - y> ball_x2 - x){
      b.x = b.px;
      b.y = b.py;
      float buf = b.sx;
      b.sx = b.sy * rebound + b.out_loop;
      b.sy = buf * rebound;
      if(b.can_break){
        exist = false;
      }
    }
  }
  
  void hit_lower_side(Ball b){
    if ((b.y - b.r) <= y+size && x < b.x && b.x < x+size && y+size < b.y){
      b.y = b.py;
      b.sy = -b.sy * rebound;
      b.sx = b.sx * friction;
      if(b.can_break){
        exist = false;
      }
    }
  }
  
  void hit_left_side(Ball b){
    if ((b.x + b.r) >= x && y < b.y&& b.y < y+size && b.x < x){
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
      if(b.x < x){
        b.sx -= b.out_loop;
      }else{
        b.sx += b.out_loop;
      }
      if(b.can_break){
        exist = false;
      }
      return;
    }
    if(dist(b.x, b.y, x, y+size) < b.r){
      b.hit_corner(x, y+size, rebound);
      b.sx -= b.out_loop;
      if(b.can_break){
        exist = false;
      }
      return;
    }
    if(dist(b.x, b.y, x+size, y+size) < b.r){
      b.hit_corner(x+size, y+size, rebound);
      b.sx += b.out_loop;
      if(b.can_break){
        exist = false;
      }
      return;
    }
  }
}

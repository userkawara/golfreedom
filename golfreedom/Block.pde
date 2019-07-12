class Block{
  int x, y, w, h;
  int dx, dy;
  float rebound = 0.3;
  float friction = 0.6;
  color col;
  boolean exist;
  
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
    rect(dx, dy, w, h);
    }
  }
  
  void hit(Ball b){
    hit_upper_side(b);
    hit_lower_side(b);
    hit_right_side(b);
    hit_left_side(b);
  }
  
  void hit_upper_side(Ball b){
    if(exist){
     if ((b.y + b.r) >= y && x < b.x && b.x < x+w && b.y<y){
      b.y = b.by;
      b.sy = -b.sy * 0.3;
      b.sx = b.sx * 0.6;
      if(-1<b.sy && b.sy<1 ){
        b.sx=0;
        b.sy=0;
        b.is_moving = false;
      }
    }
    }
  }
  
  void hit_lower_side(Ball b){
    if(exist){
    if ((b.y - b.r) <= y+h && x < b.x && b.x < x+w && b.y>y+h){
      b.y = b.by;
      b.sy = -b.sy * rebound;
      b.sx = b.sx * friction;
    }
    }
  }
  
  void hit_right_side(Ball b){
    if(exist){
    if ((b.x - b.r) <= x + w && y < b.y&& b.y < y+h && b.x>x+w){
      b.y = b.by;
      b.sx = -b.sx * friction;
      b.sy = b.sy * rebound;
    }
    }
  }
  
  void hit_left_side(Ball b){
    if(exist){
    if ((b.x + b.r) >= x && y < b.y&& b.y < y+h && b.x<x){
      b.y = b.by;
      b.sx = -b.sx * friction;
      b.sy = b.sy * rebound;
    }
    }
  }
  
  void hit_corner(Ball b){
    b.hit_coner(x,y,rebound);
    b.hit_coner(x+w,y,rebound);
    b.hit_coner(x,y+h,rebound);
    b.hit_coner(x+w,y+h,rebound);
    
  }
}

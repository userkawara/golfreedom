class Uphill_45{
  float ball_x2, ball_y2;
  int x, y, size;
  int dx, dy;
  float rebound = 0.3;
  float friction = 0.6;
  color col = color(0);
  boolean exist = true;
  
  Uphill_45(int x0, int y0, int size0){
    x = x0;
    y = y0;
    size = size0;
  }
  
  void display(Ball b){
    fill(col);
    dx = x - b.x + b.dx;
    dy = y - b.y + b.dy;
    if(exist == true){
      triangle(dx+size, dy, dx, dy+size, dx+size, dy+size);
    }
  }
  
   void hit (Ball b){
    float xh = b.x+b.r*sqrt(2)/2 - x;
    float yh = b.y+b.r*sqrt(2)/2 - y;
    
    if(exist == true){
    
      if(0<xh && 0<yh && xh<size && yh<size && yh>-xh+size){
        hit_oblique_side(b);
      }
    
      if(b.x+b.r >= x && b.x-b.r <= x+size && b.y-b.r <= y+size && b.y-b.r >= y ){
        hit_lower_side(b);
      }
    
      if(b.x-b.r <= x+size && y<b.y && b.y < y+size && b.x > x+size){
        hit_right_side(b);
      }
      
      hit_corner();
      
    }
   }
   
   void hit_oblique_side(Ball b){
      b.x = b.bx;
      b.y = b.by;
      float buf = b.sx;
      b.sx = -abs(b.sy) * rebound;
      b.sy = -abs(buf) * friction;
      exist=false;
    }
    
    void hit_lower_side(Ball b){
      b.y = b.by;
      b.sx = -b.sx * rebound;
      b.sy = b.sy * friction;
      exist=false;
    }
    
    void hit_right_side(Ball b){
      b.y = b.by;
      b.sx = -b.sx * rebound;
      b.sy = b.sy * friction;
      exist=false;
    }
  
  void hit_corner(Ball b){
   // upper corner
    if(sqrt((b.x-x+size)*(b.x-x+size)+(b.y-y)*(b.y-y))<=b.r){
      b.hit_corner(x+size,y);
    }
      // left corner
    if(sqrt((b.x-x)*(b.x-x)+(b.y-y+size)*(b.y-y+size))==b.r){
      b.hit_corner(x,y+size);
    }
      // right corner
    if(sqrt((b.x-x+size)*(b.x-x+size)+(b.y-y+size)*(b.y-y+size))==b.r){
       b.hit_corner(x+size,y+size);
     }
  }
  
}

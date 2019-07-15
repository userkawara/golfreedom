class Bumper{
  int x, y, r;
  int dx, dy;
  float power = 15;
  boolean exist = true;
  color col1 = color(255);
  color col2 = color(255);
  
  Bumper(int x0, int y0, int r0){
    x=x0;
    y=y0;
    r=r0;
  }
  
  void display(Ball b){
    dx = x - b.x + b.dx;
    dy = y - b.y + b.dy;
    if(exist){
      fill(col1);
      ellipse(dx, dy, 2*r,2*r);
      
      fill(col2);
      ellipse(dx,dy,r,r);
    }
  }
  
void hit(Ball b){
    if(exist){
      if(dist(x, y, b.x, b.y) < r + b.r){
        float theta = atan2(b.y - y, b.x - x);
        b.sx = power * cos(theta);
        b.sy = power * sin(theta);
        if(b.can_break){
          exist = false;
        }
      }
    }
  }
  
}

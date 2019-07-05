class Goal{
  int x, y, size;
  int dx, dy;
  int pw,ph; //Goal's parts
  color col;
  
  Goal(int x0, int y0){
    x=x0;
    y=y0;
  }
  
  void display(Ball b){
    dx = x-b.x+b.dx;
    dy = y-b.y+b.dy;
    
    fill(255,0,0);
    triangle(dx+size,dy,dx,dy+size/2,dx+size,dy+size);
    fill(255,255,244);
    
    rect(dx+size,dy,pw,ph);
  }
  
  boolean clear(Ball b){
    if(b.x+b.r>x+size && b.x-b.r<x+size+pw && 
    b.y-b.r>y-size/2 && b.y+b.r<y+ph){
      return true;
    }
    return false;
  }
}

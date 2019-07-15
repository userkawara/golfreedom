class Goal{
  int x, y, size = 100;
  int dx, dy;
  
  Goal(int x0, int y0){
    x = x0;
    y = y0;
  }
  
  void display(Ball b){
    dx = b.dx + (x - b.x);
    dy = b.dy + (y - b.y);
    stroke(0);
    fill(255);
    rect(dx+size*2/5, dy, size*1/10, size);
    rect(dx+size/5, dy+size*4/5, size*3/5, size/5);
    fill(color(255, 0, 0));
    triangle(dx+size*2/5, dy, dx+size*2/5, dy+size/2, dx+size, dy+size/4);
  }
  
  boolean clear(Ball b){
    if(x < b.x && b.x < x+size && y < b.y && b.y < y+size && !b.is_moving){
      return true;
    }
    return false;
  }
}

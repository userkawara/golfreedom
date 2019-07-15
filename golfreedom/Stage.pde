class Stage{
  int initial_x, initial_y;
  int w, h;
  int count_block;
  int count_uphill_45;
  int count_downhill_45;
  int count_bumper;
  
  Stage(int x_0, int y_0, int w_0, int h_0, int block_0, int uphill_45_0, int downhill_45_0, int bumper_0){
    initial_x = x_0;
    initial_y = y_0;
    w = w_0;
    h = h_0;
    count_block = block_0;
    count_uphill_45 = uphill_45_0;
    count_downhill_45 = downhill_45_0;
    count_bumper = bumper_0;
  }
  color bg(Ball b, Goal gl){
    int red , grn, blu;
    float per_dist = dist(0, 0, w, h) / 4;
    int x = int(dist(b.x, b.y, gl.x, gl.y) / per_dist);
    float y = (dist(b.x, b.y, gl.x, gl.y) % per_dist)/16;
    if(x == 0){
      red = 255;
      grn = int(200 + y);
      blu = 200;
    }else if(x == 1){
      red = int(255 - y);
      grn = 255;
      blu = 200;
    }else if(x == 2){
      red = 200;
      grn = 255;
      blu = int(200 + y);
    }else{
      red = 200;
      grn = int(255 - y);
      blu = 255;
    }
    return color(red, grn, blu);
  }
}

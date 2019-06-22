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
}

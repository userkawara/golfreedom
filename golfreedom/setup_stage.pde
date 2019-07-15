void setup_stage(){
  /*===Stage 1===*/
  s[0] = new Stage(100, 500, 3500, 1000, 17, 2, 4, 1);
  bl[0][0]  = new Block(   0, 800, 500, 200);
  bl[0][1]  = new Block( 500, 800, 500, 200);
  bl[0][2]  = new Block(1000, 800, 500, 200);
  bl[0][3]  = new Block( 750, 500, 100, 300);
  bl[0][4]  = new Block( 650, 600, 100, 200);
  bl[0][5]  = new Block( 550, 700, 100, 100);
  bl[0][6]  = new Block(1650, 750,  50, 300);
  bl[0][7]  = new Block(1650,  50,  50, 550);
  bl[0][8]  = new Block(1850, 800, 300, 200);
  bl[0][9]  = new Block(1700, 550, 150,  50);
  bl[0][10] = new Block(2300, 450,  50, 550);
  bl[0][11] = new Block(2200,  50, 100, 200);
  bl[0][12] = new Block(2200, 400, 800,  50);
  bl[0][13] = new Block(2850, 450,  50, 550);
  bl[0][14] = new Block(3275, 650, 150,  25);
  bl[0][15] = new Block(3275, 550,  25, 100);
  bl[0][16] = new Block(3400, 550,  25, 100);
  uh[0][0]  = new Uphill_45(2150, 400, 50);
  uh[0][1]  = new Uphill_45(3275, 525, 25);
  dh[0][0]  = new Downhill_45( 850, 500,300);
  dh[0][1]  = new Downhill_45(1700, 500, 50);
  dh[0][2]  = new Downhill_45(3000, 400, 50);
  dh[0][3]  = new Downhill_45(3400, 525, 25);
  bp[0][0]  = new Bumper(2225, 525, 75);
  gl[0] = new Goal(3300, 550);
  
}

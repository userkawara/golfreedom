Ball b;
Stage[] s          = new       Stage[1];
Block[][] bl       = new       Block[1][30];
Uphill_45[][] uh   = new   Uphill_45[1][15];
Downhill_45[][] dh = new Downhill_45[1][15];
Bumper[][] bp      = new      Bumper[1][10];
Goal[] gl          = new        Goal[1];

void setup(){
  size(1000, 500);
  b = new Ball();
  setup_stage();
  b.x = s[b.current_stage].initial_x;
  b.y = s[b.current_stage].initial_y;
}

void draw(){
  background(255);
  gl[b.current_stage].display(b);
  for(int i=0; i<s[b.current_stage].count_block; i++){
    bl[b.current_stage][i].display(b);
    bl[b.current_stage][i].hit(b);
  }
  for(int i=0; i<s[b.current_stage].count_uphill_45; i++){
    uh[b.current_stage][i].display(b);
    uh[b.current_stage][i].hit(b);
  }
  for(int i=0; i<s[b.current_stage].count_downhill_45; i++){
    dh[b.current_stage][i].display(b);
    dh[b.current_stage][i].hit(b);
  }
  for(int i=0; i<s[b.current_stage].count_bumper; i++){
    bp[b.current_stage][i].display(b);
    bp[b.current_stage][i].hit(b);
  }
  b.move();
  b.update_current_stage(gl[b.current_stage].clear(b), s, bl, uh, dh, bp);
  b.miss(s[b.current_stage], bl, uh, dh, bp);
  b.display(s[b.current_stage]);
}

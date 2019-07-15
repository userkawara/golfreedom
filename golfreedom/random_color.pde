color random_color(){
  color[] col = {color(250,  60, 110), color(100, 250, 120), color( 90, 140, 250), color( 70,  80, 250), color(160, 250, 180), 
                 color(200, 130, 250), color( 50, 250, 220), color(250, 250, 130), color(250, 170, 240), color(170, 250,  40),
                 color(120, 250, 180), color(200, 100,  10), color(250, 170,  70), color(250,  80,  80), color(250, 200, 240),
                 color(210, 210, 210), color(160,  20, 200), color( 70, 190, 170), color( 20, 140,  70), color( 80, 150, 190),
                 color(110,  20, 210), color( 80,  50, 190), color(170, 150, 110), color( 30, 250, 250), color(200, 250, 240),
                 color(220, 170, 150), color(120, 120, 120), color( 20, 170, 200), color(180,  10,  10), color(180, 250, 170),
                 color(250, 220, 220), color(180, 190, 250), color(210, 250, 210), color(250, 250, 100), color(140, 170, 110)};
  return col[int(random(col.length))];
}

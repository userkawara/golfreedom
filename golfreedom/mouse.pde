void mousePressed(){
  if(dist(b.dx, b.dy, mouseX, mouseY) < b.r && !b.is_moving){
    b.pressed = true;
  }
}

void mouseReleased(){
  if(b.pressed){
    float shot_power = 0.04 * dist(b.dx, b.dy, mouseX, mouseY);
    if(shot_power > b.max_velocity_of_shot){
      shot_power = b.max_velocity_of_shot;
    }
    float theta = atan2(mouseY - b.dy, mouseX - b.dx);
    b.sx = shot_power * cos(theta + PI);
    b.sy = shot_power * sin(theta + PI);
    b.pressed = false;
    b.is_moving = true;
  }
}

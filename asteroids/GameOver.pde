void gameover() {
  background(0);
  textSize(60);
  fill(255);
  if (points < hs) {
    text("GAME OVER", width/2, height/2);
  } else {
    text("NEW HIGH SCORE: " + hs, width/2, height/2);
    hs = points;
  }
}

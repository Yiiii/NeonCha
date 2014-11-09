/*Class Collition {

  void movementLogic() {
    Pos.x += ballVel.x;
    Pos.y += ballVel.y;
    if (p1u) p1y -= paddleSpeed;
    if (p1d) p1y += paddleSpeed;
    if (p2u) p2y -= paddleSpeed;
    if (p2d) p2y += paddleSpeed;
  }
  void collisionLogic() {
    //left Paddle
    if (Pos.x-Size/2 <= p1x+(paddleDim.x*.5)) {
      Pos.x=1+Size/2+(p1x+(paddleDim.x*.5));
      Vel.x*=-1;
      lScore++;
    }
    //right paddle
    if (Pos.x+Size/2 >= p2x-(paddleDim.x*.5)) {
      Pos.x=(p2x-(paddleDim.x*.5))-Size/2-1;
      Vel.x*=-1;
      rScore++;
    }
    //top side
    if (ballPos.y-Size/2<=0) {
      Pos.y+=1;
      Vel.y*=-1;
    }
    //bottom side
    if (Pos.y+Size/2>=height) {
      Pos.y-=1;
      Vel.y*=-1;
    }
  }
}
*/


/*
  for (int l = 0; l < blebs.length; l++) {
    if (l != 0) {
      for (int j = 0; j < blebs.length; j++) {
        if (blebs[l].intersects(blebs[j])) {
          blebs[l].resolveCollision(blebs[j]);
        }
      }
    }
  } 
  */

/*
  float rotateBubbleX(float speedX, float angle) {
    float rotatedVelocityX = speedX * cos(angle) - speedY * sin(angle);
    return rotatedVelocityX;
  }
  float rotateBubbleY(float speedY, float angle) {
    float rotatedVelocityY = speedX * sin(angle) + speedY * cos(angle);
    return rotatedVelocityY;
  }

  void resolveCollision(Bubbles other) {
    float xVelocityDiff = this.speedX - other.speedX;
    float yVelocityDiff = this.speedY - other.speedY;

    float xDist = this.coordX - other.coordX;
    float yDist = this.coordX - other.coordY;

    // Prevent accidental overlap of particles
    if (xVelocityDiff * xDist + yVelocityDiff * yDist >= 0 && xDist >= 0 || yDist >= 0) {

      // Grab angle between the two colliding particles
      float angle = -atan2(other.coordY - this.coordY, other.coordX - this.coordX);

      // Store mass in var for better readability in collision equation
      float m1 = this.mass;
      float m2 = other.mass;

      // Velocity before equation
      float u1x = rotateBubbleX(this.speedX, angle);
      float u1y = rotateBubbleX(this.speedY, angle);
      float u2x = rotateBubbleY(other.speedY, angle);
      float u2y = rotateBubbleY(other.speedY, angle);

      // Velocity after 1d collision equation
      float v1x = u1x * (m1 - m2) / (m1 + m2) + u2x * 2 * m2 / (m1 + m2);
      float v1y = u1y;
      float v2x = u2x * (m1 - m2) / (m1 + m2) + u1x * 2 * m2 / (m1 + m2);
      float v2y = u2y;

      // Final velocity after rotating axis back to original location
      float vFinal1x = rotateBubbleX(v1x, -angle);
      float vFinal1y = rotateBubbleY(v1y, -angle);
      float vFinal2x = rotateBubbleX(v2x, -angle);
      float vFinal2y = rotateBubbleY(v2y, -angle);

      // Swap particle velocities for realistic bounce effect
      this.speedX = vFinal1x;
      this.speedY = vFinal1y;

      this.speedX = vFinal2x;
      this.speedY = vFinal2y;
    }
  }*/

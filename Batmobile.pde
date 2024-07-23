class Batmobile {
  float batX, batY;
  color couleur;
  float tailleBat;
  int vitesseBat=3;


  Batmobile() {
    batX = width/2;
    batY= height-20;
    tailleBat = 30;
    couleur = color(255);
  }


  void dessinerBat() {
    //dessiner voiture
    rectMode(CENTER);
    fill(couleur);
    rect(batX, batY, tailleBat, tailleBat);
  }


  void bougerBat() {
    //bouger la voiture à l'aide des touches clavier
    if (keyPressed) {
      if (keyCode == LEFT && batX-tailleBat/2>0) {
        batX -= vitesseBat;
      } else if (keyCode == RIGHT && batX+tailleBat/2<width) {
        batX += vitesseBat;
      }
    }
  }
}

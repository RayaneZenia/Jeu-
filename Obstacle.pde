class Obstacle {

  float obX;
  float obY;
  color couleur;
  int vitesseOb=2;
  float tailleOb;

  Obstacle(float obX, float obY, color couleur, float tailleOb) {
    this.obX=obX;
    this.obY=obY;
    this.couleur=couleur;
    this.tailleOb=tailleOb;
  }
  void dessinerOb() {
    //dessiner obstacles
    fill(couleur);
    circle(obX, obY, tailleOb);
  }
  void bougerOb() {
    obY += vitesseOb;
    if (obY>height) {
      //Renouveler les obstacles
      obY=0;
      obX=random(width);
    }
  }
}

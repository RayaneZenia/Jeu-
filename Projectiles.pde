class Projectile {
  color couleur;
  int vitessePro=5;
  int numBullets=10;
  float bulletX;
  float bulletY;
  int bulletSize;
  int bulletSpeed;

  Projectile(int bulletSize, int bulletSpeed, color couleur ) {
    this.bulletSize=bulletSize;
    this.bulletSpeed=bulletSpeed;
    this.couleur=couleur;

    for (int i = 0; i < numBullets; i++) { // Initialisation des positions des balles
      bulletX = -100; // Les balles sont initialement hors écran
      bulletY = -100;
    }
  }

  void bouger() {
    for (int i = 0; i < numBullets; i++) {
      bulletY -= bulletSpeed; // Déplacement vers le haut
      if (bulletY < 0) { // Si la balle sort de l'écran, elle est réinitialisée
        bulletX = -100;
        bulletY = -100;
      }
    }
  }

  void dessiner() {
    for (int i = 0; i < numBullets; i++) {
      fill(couleur);
      ellipse(bulletX, bulletY, bulletSize, bulletSize); // Affichage de la balle
    }
  }
}

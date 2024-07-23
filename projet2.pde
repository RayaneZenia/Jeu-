// Projet 1 Processing 2
// NOM         : ZENIA
// Prénom      : Rayane
// Groupe      : G3
// N° étudiant : 223101

///////////////////////////////////
//les variables globales
Batmobile Voiture;
Obstacle[] ennemies;
Projectile bombes;
int score=0;
boolean gameOver = false;
///////////////////////////////////


void setup() {
  size(500, 500);
  Voiture = new Batmobile();
  ennemies = new Obstacle[20];
  for (int i=0; i<ennemies.length; i++) {
    ennemies[i] = new Obstacle(random(width), random(height), color(255, 0, 0), 20);
  }
  bombes = new Projectile(5, 1, color(0, 0, 255));
}


void draw() {
  if (gameOver) {
    //arrière-plan de fin de jeu
    background(255);
    textAlign(CENTER);
    textSize(32);
    fill(0);
    text("Game Over !\nScore: " + score + "\nAppuyez sur ENTER pour rejouer", width/2, height/2);
  } else {
    //le jeu
    background(0);
    Voiture.dessinerBat();
    Voiture.bougerBat();

    for (int i=0; i<ennemies.length; i++) {
      ennemies[i].dessinerOb();
      ennemies[i].bougerOb();
    }

    bombes.bouger();
    bombes.dessiner();


    for (int i=0; i<ennemies.length; i++) {
      // fin du jeu en cas de collision avec un ennemi
      if (dist(Voiture.batX, Voiture.batY, ennemies[i].obX, ennemies[i].obY) < (Voiture.tailleBat+ennemies[i].tailleOb)/2) {
        gameOver();
        ennemies[i].obY=height+10;
      }
    }
  }
  for (int i=0; i<ennemies.length; i++) {
    //collision des bombes avec un ennemi
    if (dist(bombes.bulletX, bombes.bulletY, ennemies[i].obX, ennemies[i].obY)<(bombes.bulletSize/2+ennemies[i].tailleOb/2)) {
      score++;
      //disparaitre l'ennemi et la bombe
      ennemies[i].obY=-10;
      bombes.bulletY=-10;
    }
  }


  //afficher le score
  fill(255);
  textAlign(LEFT);
  textSize(20);
  text("Score " + score, 20, 20);

  if (score>10) {
    //augmener la vitesse des ennemies
    for (int i=0; i<ennemies.length; i++) {
      ennemies[i].vitesseOb=3;
    }
  }
  if (score>20) {
    for (int i=0; i<ennemies.length; i++) {
      //augmener la vitesse des ennemies et la vitesse des projectiles
      ennemies[i].vitesseOb=4;
      bombes.vitessePro=6;
    }
  }
  if (score>30) {
    for (int i=0; i<ennemies.length; i++) {
      //augmener la vitesse des ennemies et la vitesse des projectiles
      ennemies[i].vitesseOb=5;
      bombes.vitessePro=8;
    }
  }
  if (score>40) {
    for (int i=0; i<ennemies.length; i++) {
      //augmener la vitesse des ennemies et la vitesse des projectiles
      ennemies[i].vitesseOb=6;
      bombes.vitessePro=10;
    }
  }


  if (score==50) {
    //victoire
    background(255);
    textAlign(CENTER);
    textSize(32);
    fill(0);
    text("Bravo vous avez gagne !", width/2, height/2);
    //remettre le score à 0 et les vitesses initiales
    score=0;
    for (int i=0; i<ennemies.length; i++) {
      ennemies[i].vitesseOb=2;
      bombes.vitessePro=5;
    }
  }
}

void keyPressed() {
  if (keyCode == ' ') { // Si la touche espace est appuyée
    for (int i = 0; i < bombes.numBullets; i++) {
      if (bombes.bulletY < 0) { // Si une balle est disponible (hors écran)
        bombes.bulletX =Voiture.batX; // Position de la balle sur l'axe X
        bombes.bulletY =Voiture.batY-10; // Position de la balle en bas de l'écran
        break; // Sortie de la boucle pour ne créer qu'une balle à la fois
      }
    }
  }
  // Si la touche Entrée est appuyée et que le jeu est terminé, redémarrer le jeu
  if (keyCode == ENTER && gameOver) {
    //remettre le score à 0 et les vitesses initiales
    score = 0;
    gameOver = false;
    for (int i=0; i<ennemies.length; i++) {
      ennemies[i].vitesseOb=2;
    }
  }
}


void gameOver() {
  // Cette fonction est appelée lorsque le jeu est terminé
  gameOver = true;
}

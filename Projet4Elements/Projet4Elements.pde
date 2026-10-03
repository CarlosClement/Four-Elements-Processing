float taille = 0;                            // On initialise la taille du soleil

float x = 0;                                 // On initialise le X du cercle

float[] y = new float[10];                   // On initialise les Y des cercles

PVector[] vent1 = new PVector[100];
PVector[] vent2 = new PVector[100];
PVector[] vent3 = new PVector[100];
PVector[] vent4 = new PVector[100];
PVector[] vent5 = new PVector[100];          // On initialise les vecteurs de vent
PVector[] vent6 = new PVector[100];
PVector[] vent7 = new PVector[100];
PVector[] vent8 = new PVector[100];
PVector[] vent9 = new PVector[100];
PVector[] vent10 = new PVector[100];

PFont font;                                  // On initialise la police d'ecriture de la fenetre initiale
PFont font2;                                 // On initialise la police d'ecriture des modes


float acc = 0;                               // On initialise le y de l'eau (pluie)

float[] gouttes = new float[250];            // On initialise les coordonnees de depart des gouttes
float[] tailles = new float[250];            // On initialise les tailles de depart des gouttes

float[] position = new float[25];            // On initialise les coordonnees de depart des feux
float[] fuegos = new float[25];              // On initialise les tailles de depart des feux

////////////////////////////////////// SETUP
void setup(){
  size(800, 800);                            // taille de la fenetre
  pixelDensity(1);
  //fullScreen();
  
  font = loadFont("start.vlw");              // chargement de la police 1
  font2 = loadFont("modes.vlw");             // chargement de la police 2
  
  for(int i = 0; i < 10; i++){
    y[i] = random(height-1);                 // Pour definir les y des cercles apres le setup
  }
  
  for(int i = 0; i < 250; i++){
    tailles[i] = random(0.05, 0.10);              // Pour definir les tailles des gouttes apres le setup
    gouttes[i] = random(0, width/tailles[i]);     // Pour definir les x des gouttes apres le setup
  }
  
  for(int i = 0; i < 25; i++){
    fuegos[i] = random(0.2, 0.4);                 // Pour definir les tailles des feux apres le setup
    position[i] = random(0, width/fuegos[i]);     // Pour definir les x des feux apres le setup
  }
  
}


////////////////////////////////////// DRAW
void draw(){
  
  Arriere_Plan();
  
  if(keyCode == ENTER){
    Arriere_P(210, 110, 10);
    textFont(font2);                              //Changement de police pour les differents modes
    textSize((height+width)/50);
    textAlign(CENTER, CENTER);
    fill(200, 50, 50);
    text("VEUILLEZ CHOISIR UN MODE:", width/2, height/2 - 200);
    fill(100, 50, 50);
    text("TERRE = fleche du haut", width/2, height/2 - 100);
    text("EAU = fleche du bas", width/2, height/2 - 50);
    text("FEU = fleche de gauche", width/2, height/2);
    text("AIR = fleche de droite", width/2, height/2 + 50);
    fill(0, 0, 0);
    text("Pour revenir au MENU = Appuyer sur entrée", width/2, height/2 + 200);
 
  } else if (keyCode == UP){
    Arriere_P(0, 0, 255);            // TERRE
  
    fill(255, 255, 255);
  
    pushMatrix();
      translate(-75, -600);
      Nuage();
      Nuage_2();
      translate(0, 200);
      Nuage_3();
      translate(-425, -125);
      Nuage_2();
      translate(1000, 150);
      Nuage();
    popMatrix();
    
    arbre_Recur(width/2-200, height-23, width/2-200, height-200);
    terre();
    arbre_Recur(width/1.5-200, height-23, width/1.5-200, height-100); 
    
  } else if (keyCode == DOWN){
    Arriere_P(10, 10, 10);         // EAU 
    pluie();
    terre();
    
  } else if (keyCode == LEFT){
    Arriere_P(255, 50, 50);            // FEU
    terre_2();
    incendie();
    
  } else if (keyCode == RIGHT){
    Arriere_P(50, 150, 50);        // AIR
    air();
    terre();
  }
  
  
  //printArray(vent1);             // Affichage des points
  //AALC();                        // Aide (Cf fin de la page)
}

/////////////////    ARRIERE PLAN    //////////////////////

void Arriere_Plan(){
  background(170, 210, 250);                      // Pour initialiser l'arriere plan de depart
  textFont(font);
  textAlign(CENTER, CENTER);
  
  float cpt = (width + height)/4 + 15;
  
  for(float i = 0; i < cpt; i++){
    
    fill(255 - i/2, 255 - i/2, 255);    
    textSize(i/7.80 + 0.01);                     
    text("Appuyer sur entrée", -15 + i, -15 + i);
      
    i += 1;
  }
  
  fill(0, 0, 0);
  textSize((height+width)/30 + 0.5);
  text("Appuyer sur entrée", width/2, height/2 + 4);
  
  fill(255, 255, 255);
  textSize((height+width)/30 - 1);
  text("Appuyer sur entrée", width/2, height/2);
  
  
  //Creation des nuages de l'ecran d'accueil
  pushMatrix();
  
    translate(-100, 100);
    fill(0,0,0);
    Nuage();
    Nuage_2();
    Nuage_3();
    translate(5, -5);
    fill(255,255,255);
    Nuage();
    Nuage_2();
    Nuage_3();
    
    translate(500, -200);
    fill(0,0,0);
    Nuage();
    Nuage_2();
    Nuage_3();
    translate(5, -5);
    fill(255,255,255);
    Nuage();
    Nuage_2();
    Nuage_3();
    
    translate(-900, -50);
    fill(0,0,0);
    Nuage();
    Nuage_2();
    Nuage_3();
    translate(5, -5);
    fill(255,255,255);
    Nuage();
    Nuage_2();
    Nuage_3();
    
    translate(1000, -400);
    fill(0,0,0);
    Nuage();
    Nuage_2();
    Nuage_3();
    translate(5, -5);
    fill(255,255,255);
    Nuage();
    Nuage_2();
    Nuage_3();
    
    translate(-700, 100);
    fill(0,0,0);
    Nuage();
    Nuage_2();
    Nuage_3();
    translate(5, -5);
    fill(255,255,255);
    Nuage();
    Nuage_2();
    Nuage_3();
    
  popMatrix();
  
}


void Nuage(){              //Premier nuage
  noStroke();
  
  ellipse(width/6, height/1.2, 100, 50);
  ellipse(width/6 + 30, height/1.2 - 20, 100, 50);
  ellipse(width/6 - 20, height/1.2 + 20, 100, 50);
  ellipse(width/6 + 30, height/1.2 + 20, 100, 50);
  ellipse(width/6 + 100, height/1.2 - 40, 100, 50);
  ellipse(width/6 + 100, height/1.2 - 20, 100, 50);
  ellipse(width/6 + 100, height/1.2 + 20, 100, 50);
  ellipse(width/6 + 150, height/1.2 + 20, 100, 50);
  ellipse(width/6 + 150, height/1.2 - 20, 100, 50);
  ellipse(width/6 + 190, height/1.2, 100, 50);
  ellipse(width/6 + 40, height/1.2, 100, 50);
}


void Nuage_2(){           //Second nuage
  noStroke();
  
  ellipse(width/1.5, height/1.2, 100, 50);
  ellipse(width/1.5 + 70, height/1.2, 100, 50);
  ellipse(width/1.5 + 140, height/1.2, 100, 50);
  
  ellipse(width/1.5 + 25, height/1.2 - 20, 100, 50);
  ellipse(width/1.5 + 100, height/1.2 - 20, 100, 50);
  
  ellipse(width/1.5 + 50, height/1.2- 40, 100, 50);
}


void Nuage_3(){            //Troisieme nuage
  noStroke();
  
  ellipse(width/2, height/1.5, 75, 50);
  ellipse(width/2 + 50, height/1.5 + 5, 75, 50);
  ellipse(width/2 + 25, height/1.5 - 20, 75, 50);
}


void Arriere_P(float R, float G, float B){        //Fonction arriere plan pour les differents modes
  loadPixels();
  
  for(int j = 0; j < height; j++){
    for(int i = 0; i < width; i++){
        pixels[i*height+j] = color(175 + R-i/5, 175 + G-i/5, 175 + B-i/5);
    }
  }
  updatePixels();
}


/////////////////    EAU    //////////////////////

void eau(){
  float R = random(150, 200);
  
  fill(0,R,200);
  stroke(0,0,0);
  //noStroke();
  
  beginShape();
    vertex(width/2, 0 + acc);
    bezierVertex(width/2, height/4 + acc, width/1.5, height/2 + acc, width/2, height/2 + acc);
    bezierVertex(width/3, height/2 + acc, width/2, height/4 + acc, width/2, 0 + acc);
    vertex(width/2, 0 + acc);                                                             // pour fermer la boucle
  endShape();
  
  acc += 40;
  
  if(acc > height*12){
    acc = 0;            
  }
}
   
void pluie(){
  for(int in = 0; in < 250; in++){
    pushMatrix();
      scale(tailles[in]);
      translate(gouttes[in], 0);
      eau();
    popMatrix();
  }
}


//////////////////    TERRE    ///////////////////////

void terre(){
  float R1 = random(200, 255);
  randomSeed(0);
  for(float i = 0; i < width; i = i + noise(5)){          // pour creer de l'herbe a l'aide de lignes
    lineMouse(i,width-25,i,width-random(70,125));
    stroke(150,R1,150);
    strokeWeight(1);
  }
  
  noStroke();
  Taille();
  for(float i = 0; i < min(taille,127); i+=10){
    fill(255,100+i,0);                                    // Pour donner une couleur qui decremente au soleil
    ellipse(width, 0, taille-i, taille-i);
  }
  
  //arbre_Recur(width/2-200, height-23, width/2-200, height-200);           // ATTENTION LOURD, NE PAS DECOMMENTER
  //arbre_Recur(width/1.5-200, height-23, width/1.5-200, height-100);       // ATTENTION LOURD, NE PAS DECOMMENTER
  
  pushMatrix();
    Posi_buisson(width-random(75,150), height-50, 40, 40);
  popMatrix();
  
  pushMatrix();
    Posi_buisson(width-random(200, 250), height-30, 20, 20);
  popMatrix();
  
  fill(128,0,0);
  rect(-1, height-25, width+1, 25);                       // Pour creer la terre
}


void terre_2(){
  
  for(float i = 0; i < width; i = i + noise(5)){          // Pour creer de l'herbe a l'aide de lignes
    lineMouse(i,width-25,i,width-random(70,125));
    stroke(0,0,0);
    strokeWeight(1);
  }
  
  noStroke();
  Taille();
  for(float i = 0; i < min(taille,127); i+=10){
    fill(255,100+i,0);                                   // Pour donner une couleur qui decremente au soleil
    ellipse(width, 0, taille-i, taille-i);
  }
  
  fill(128,0,0);
  rect(-1, height-25, width+1, 25);                      // Pour creer la terre
}


void Taille(){
  taille += 4;
  if(taille >= width/1.5){                               // Pour augmenter la taille du soleil
    taille = width/1.5;
  }
  
}


void lineMouse(float a, float b, float c, float d){
  if (dist(c, d, mouseX, mouseY) < 100 && (c - mouseX) < 0){
    line(a,b,c-(width-mouseX)/6+30,d-(height-mouseY)/6+30);                     // Pour deplacer l'herbe en fonction de la souris
  } else if (dist(c, d, mouseX, mouseY) < 100 && (c - mouseX) > 0){
    line(a,b,c+(width-mouseX)/6-10,d+(height-mouseY)/6-10);
  } else {
    line(a,b,c,d);
  }
  
}


void arbre_Recur(float x1, float y1, float x2, float y2){
  if (dist(x1, y1, x2, y2) < 1){
    return;
  }
  
  strokeWeight(log(dist(x1,y1,x2,y2)));
  stroke(60, 128-dist(x1,y1,x2,y2), 40);
  
  //stroke(250-dist(x1,y1,x2,y2), 170-dist(x1,y1,x2,y2), 220-dist(x1,y1,x2,y2));    // UNE AUTRE COULEUR POSSIBLE POUR L'ARBRE
  
  float x3 = x2 + (x2-x1)*random(0.3, 0.4) + (y2-y1)*random(0.1, 0.3); 
  float y3 = y2 + (y2-y1)*random(0.3, 0.4) + (x1-x2)*random(0.1, 0.3);
  
  float x4 = x2 + (x2-x1)*random(0.3, 0.4) - (y2-y1)*random(0.1, 0.3); 
  float y4 = y2 + (y2-y1)*random(0.3, 0.4) - (x1-x2)*random(0.1, 0.3);
  
  float x5 = x2 + (x2-x1)*random(0.4, 0.5) + (y2-y1)*random(0.4, 0.5); 
  float y5 = y2 + (y2-y1)*random(0.4, 0.5) + (x1-x2)*random(0.4, 0.5);
  
  float x6 = x2 + (x2-x1)*random(0.4, 0.5) - (y2-y1)*random(0.4, 0.5); 
  float y6 = y2 + (y2-y1)*random(0.4, 0.5) - (x1-x2)*random(0.4, 0.5);
  
  line(x1, y1, x2, y2);
  
  stroke(60, 200-dist(x1,y1,x2,y2), 40);
  ellipse(x2, y2, log(dist(x1,y1,x2,y2)), log(dist(x1,y1,x2,y2))/2);
  
  arbre_Recur(x2, y2, x3, y3);                      //arbre gauche
  arbre_Recur(x2, y2, x4, y4);                      //arbre droite
  arbre_Recur(x2, y2, x5, y5);                      //arbre second gauche
  arbre_Recur(x2, y2, x6, y6);                      //arbre second droite
  
}


void buisson(float x, float y, float size_x, float size_y){
  float acc = size_y; 
  for(float j = 0; j < size_y; j += 5){
    noStroke();
    fill(random(75,100), random(200,255), random(75,100));
    ellipse(x, y+acc, size_x-j, size_y-j);
    acc = (acc-j)/2;
  }
}


void Posi_buisson(float a, float b, float c, float d){
  translate(a, b);
  float angle = random(6,8);
  for(float i = 0; i < angle*2; i++){
    rotate(PI/angle);
    buisson(0, 0, c, d);
  } 
}


//////////////////    FEU    ///////////////////////

void feu(){
  float bouge = random(-7, 7);
  
  float R1 = random(0, 75);
  fill(255,R1,0);
  stroke(0,0,0);
  
  beginShape();                 
    vertex(width/2, height);
    bezierVertex(width/6 + bouge, height/1.2, width/2 + bouge, height/1.5,width/2 + bouge*4, height/2);                        
    bezierVertex(width/1.65 + bouge, height/1.75, width/1.8 + bouge, height/1.55, width/1.7 + bouge, height/1.3);
    bezierVertex(width/1.60 + bouge, height/1.15, width/1.45 + bouge, height/1.4, width/1.45 + bouge*4, height/1.5);
    bezierVertex(width/1.4 + bouge, height/1.4, width/1.4 + bouge, height, width/2, height);
    vertex(width/2, height);
  endShape();                                                                                     
  
  // FIN DU FEU 1
  
  float R2 = random(100, 125);
  fill(255,R2,0);
  stroke(0,0,0);
  
  beginShape();                 
    vertex(width/2, height);
    bezierVertex(width/4 + bouge, height/1.2, width/2 + bouge, height/1.5, width/1.95 + bouge*4, height/1.7);                        
    bezierVertex(width/1.85 + bouge, height/1.65, width/1.85 + bouge, height/1.55, width/1.8 + bouge, height/1.3);
    bezierVertex(width/1.75 + bouge, height/1.15, width/1.7 + bouge, height/1.15, width/1.55 + bouge*4, height/1.2);
    bezierVertex(width/1.6 + bouge, height/1.1, width/1.6 + bouge, height/1.05, width/2, height);
    vertex(width/2, height);
  endShape();
  
  // FIN DU FEU 2
  
  float R3 = random(175, 225);
  fill(255,R3,0);
  stroke(0,0,0);
  
  beginShape();
    vertex(width/2, height);
    bezierVertex(width/1.7 + bouge, height/1.1, width/1.7 + bouge, height/1.1, width/2 + bouge*2, height/1.35);
    bezierVertex(width/2.1 + bouge, height/1.15, width/2.1 + bouge, height/1.15, width/2.3 + bouge*2, height/1.225);
    bezierVertex(width/2.3 + bouge, height/1.1, width/2.3 + bouge, height/1.1, width/2, height);
    vertex(width/2, height);
  endShape();
   
  // FIN DU FEU 3
  
  float R4 = random(215, 255);
  float R5 = random(140, 255);
  fill(255,R4,R5);
  stroke(0,0,0);
  
  beginShape();
    vertex(width/2, height);
    bezierVertex(width/1.8 + bouge, height/1.05, width/1.8 + bouge, height/1.1, width/1.95 + bouge*2, height/1.18);
    bezierVertex(width/2 + bouge, height/1.05, width/2.25 + bouge, height/1.15, width/2, height);
    vertex(width/2, height);
  endShape();
  
  // FIN DU FEU 4
}


void incendie(){
    for(int i = 0; i < 25; i++){
    pushMatrix();
      scale(fuegos[i]);
      translate(-400+position[i], height*((1-fuegos[i])/fuegos[i]) - 75);
      feu();
      float ran = random(0, 100);
      fill(ran, ran, ran);
      for(int j = 0; j < 20; j++){
        translate(300, -j*200);
        Nuage();
        Nuage_2();
        Nuage_3();
      }
    popMatrix();
  }
}




///////////////////    AIR    //////////////////////

void air(){
  Affiche_air();
  MAJ_air();
}


void MAJ_air(){
  //print("x: ", x,"y: ", y);             // Pour voir les coordonnees des points
  
  for(int i = 99; i > 0; i--){
    vent1[i] = vent1[i-1];
    vent2[i] = vent2[i-1];
    vent3[i] = vent3[i-1];
    vent4[i] = vent4[i-1];
    vent5[i] = vent5[i-1];
    vent6[i] = vent6[i-1];
    vent7[i] = vent7[i-1];
    vent8[i] = vent8[i-1];
    vent9[i] = vent9[i-1];
    vent10[i] = vent10[i-1];
  }
  
  deplacement();
  
  vent1[0] = new PVector(x, y[0]);
  vent2[0] = new PVector(x, y[1]);
  vent3[0] = new PVector(x, y[2]);
  vent4[0] = new PVector(x, y[3]);
  vent5[0] = new PVector(x, y[4]);
  vent6[0] = new PVector(x, y[5]);
  vent7[0] = new PVector(x, y[6]);
  vent8[0] = new PVector(x, y[7]);
  vent9[0] = new PVector(x, y[8]);
  vent10[0] = new PVector(x, y[9]);
   
}


void Affiche_air(){
  float R = random(200, 225);
  fill(R,R,R);
  noStroke();
  
  for (int i = 0; i < 100; i++) {
    if(vent1[i] != null)
      ellipseMouse(vent1[i].x, vent1[i].y, 5, 5);
    if(vent2[i] != null)
      ellipseMouse(vent2[i].x, vent2[i].y, 5, 5);
    if(vent3[i] != null)
      ellipseMouse(vent3[i].x, vent3[i].y, 5, 5);
    if(vent4[i] != null)
      ellipseMouse(vent4[i].x, vent4[i].y, 5, 5);
    if(vent5[i] != null)
      ellipseMouse(vent5[i].x, vent5[i].y, 5, 5);
    if(vent6[i] != null)
      ellipseMouse(vent6[i].x, vent6[i].y, 5, 5);
    if(vent7[i] != null)
      ellipseMouse(vent7[i].x, vent7[i].y, 5, 5);
    if(vent8[i] != null)
      ellipseMouse(vent8[i].x, vent8[i].y, 5, 5);
    if(vent9[i] != null)
      ellipseMouse(vent9[i].x, vent9[i].y, 5, 5);
    if(vent10[i] != null)
      ellipseMouse(vent10[i].x, vent10[i].y, 5, 5);
  }
}


void deplacement(){                 // deplacement du cercle d'apres l'axe horizontal
  x += 3;
  if(x > width){
    x = 0;
  }
}


void ellipseMouse(float a, float b, float c, float d){
  if (dist(a, b, mouseX, mouseY) < 100 && (b - mouseY) < 0){
    ellipse(a, b-(100-dist(a, b, mouseX, mouseY))+10*sin(a/20), c+10, d);
  } else if (dist(a, b, mouseX, mouseY) < 100 && (b - mouseY) > 0){
    ellipse(a, b+(100-dist(a, b, mouseX, mouseY))+10*sin(a/20), c+10, d);
  } else {
    ellipse(a, b+10*sin(a/20), c, d);
  }
}


///////////////////    AIDE A LA CONSTRUCTION    //////////////////////

void AALC(){
  ///// AIDE A LA CONSTRUCTION
  
  fill(255,255,255);
  beginShape();
    ellipse(0,0,40,40);
    ellipse(width,height,40,40);
  endShape();
  
  fill(255,128,255);
  beginShape();
     ellipse(width,0,40,40);
     ellipse(0,height,40,40);
  endShape();
  
  fill(128,255,255);
  beginShape();
    ellipse(width/2,height/2,40,40);
  endShape();
   
  fill(128,128,128);
  beginShape();
    ellipse(width,height/2,40,40);
    ellipse(width/2,height,40,40);
    ellipse(width/2,0,40,40);
    ellipse(0,height/2,40,40);
  endShape();
  
  fill(0,0,255);
  beginShape();
    ellipse(width/1.35,height/2,40,40);
    ellipse(width/2,height/1.35,40,40);
  endShape();
  
  fill(0,0,0);
  text("width / 1.35",width/1.35,height/2);
  text("height / 1.35",width/2,height/1.35);
  
  fill(255,255,0);
  beginShape();
    ellipse(width/1.15,height/2,40,40);
    ellipse(width/2,height/1.15,40,40);
  endShape();
  
  fill(0,0,0);
  text("width / 1.15",width/1.15,height/2);
  text("height / 1.15",width/2,height/1.15); 
  
  ///// FIN AIDE A LA CONSTRUCTION
}

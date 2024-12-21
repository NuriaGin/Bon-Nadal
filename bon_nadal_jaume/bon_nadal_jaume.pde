int snowflakes = 200;  // Número de copos de nieve
Snowflake[] flakes = new Snowflake[snowflakes];  // Array para los copos de nieve

void setup() {
  size(600, 400);  // Tamaño de la ventana
  background(0, 102, 204);  // Fondo azul para cielo
  for (int i = 0; i < snowflakes; i++) {
    flakes[i] = new Snowflake();  // Crear copos de nieve
  }
}

void draw() {
  background(0, 102, 204);  // Vuelve a pintar el fondo en cada frame
  
  // Dibuja el árbol de Navidad
  drawTree();
  
  // Dibuja la estrella en la cima del árbol
  drawStar(width / 2, 100);
  
  // Dibuja los regalos alrededor del árbol
  drawPresents();
  
  // Dibuja los copos de nieve
  for (int i = 0; i < snowflakes; i++) {
    flakes[i].update();  // Actualiza la posición de los copos
    flakes[i].display();  // Dibuja cada copo de nieve
  }
  
  // Añadir un mensaje
  fill(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Bon Nadal Jaume t'estimo", width / 2, height - 50);
}

// Función para dibujar el árbol de Navidad
void drawTree() {
  // Triángulo principal del árbol
  fill(34, 139, 34);  // Color verde para el árbol
  triangle(width / 2 - 100, height - 80, width / 2 + 100, height - 80, width / 2, height - 250);
  triangle(width / 2 - 80, height - 140, width / 2 + 80, height - 140, width / 2, height - 210);
  triangle(width / 2 - 60, height - 200, width / 2 + 60, height - 200, width / 2, height - 170);
  
  // Tronco del árbol
  fill(139, 69, 19);  // Color marrón para el tronco
  rect(width / 2 - 25, height - 80, 50, 80);
}

// Función para dibujar la estrella
void drawStar(float x, float y) {
  fill(255, 223, 0);  // Color amarillo para la estrella
  beginShape();
  for (int i = 0; i < 5; i++) {
    float angle = TWO_PI / 5 * i;
    float x1 = x + cos(angle) * 20;
    float y1 = y + sin(angle) * 20;
    vertex(x1, y1);
  }
  endShape(CLOSE);
}

// Función para dibujar los regalos
void drawPresents() {
  fill(255, 0, 0);  // Regalos rojos
  rect(width / 2 - 150, height - 70, 50, 50);
  rect(width / 2 + 100, height - 70, 50, 50);
  fill(0, 255, 0);  // Regalos verdes
  rect(width / 2 - 75, height - 40, 50, 50);
  rect(width / 2 + 150, height - 40, 50, 50);
}

// Clase para los copos de nieve
class Snowflake {
  float x, y, speed, size;
  
  Snowflake() {
    x = random(width);
    y = random(height);
    speed = random(1, 3);
    size = random(2, 5);
  }
  
  // Actualiza la posición de cada copo de nieve
  void update() {
    y += speed;
    if (y > height) {
      y = 0;
      x = random(width);
    }
  }
  
  // Dibuja el copo de nieve
  void display() {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
}

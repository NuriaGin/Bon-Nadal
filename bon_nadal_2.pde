int snowflakes = 200;  // Número de copos de nieve
Snowflake[] flakes = new Snowflake[snowflakes];  // Array de copos de nieve

void setup() {
  size(600, 400);  // Tamaño de la ventana
  
  // Crear los copos de nieve
  for (int i = 0; i < snowflakes; i++) {
    flakes[i] = new Snowflake();  // Crear un copo de nieve
  }
}

void draw() {
  // Crear el fondo degradado en cada frame
  createGradient();
  
  // Dibujar y mover los copos de nieve
  for (int i = 0; i < snowflakes; i++) {
    flakes[i].update();  // Actualizar la posición de cada copo
    flakes[i].show();    // Dibujar el copo en pantalla
  }
// Añadir un mensaje
  fill(255);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Bon Nadal Jaume t'estimo", width / 2, height - 50);
}

// Función para crear el fondo degradado
void createGradient() {
  // Definir los colores para el degradado
  color colorStart = color(0, 0, 102);  // Amarillo
  color colorEnd = color(255, 255, 0);      // Azul oscuro
  
  // Dibujar el degradado mediante líneas horizontales
  for (int i = 0; i < height; i++) {
    // Interpolamos entre el color de inicio y el color final en función de la posición vertical
    color interColor = lerpColor(colorStart, colorEnd, map(i, 0, height, 0, 1));
    stroke(interColor);  // Establecer el color de la línea
    line(0, i, width, i);  // Dibujar una línea horizontal en la posición i
  }
}



// Clase que representa a un copo de nieve
class Snowflake {
  float x, y;        // Posición del copo
  float speedY;      // Velocidad de caída
  float size;        // Tamaño del copo
  
  // Constructor para crear un nuevo copo de nieve
  Snowflake() {
    x = random(width);      // Posición aleatoria en el eje X
    y = random(-500, -50);  // Posición aleatoria fuera de la pantalla en el eje Y
    speedY = random(1, 3);  // Velocidad de caída aleatoria
    size = random(5, 10);    // Tamaño aleatorio del copo
  }
  
  // Método para actualizar la posición del copo
  void update() {
    y += speedY;  // El copo se mueve hacia abajo
    if (y > height) {  // Si el copo llega al fondo, lo reposicionamos arriba
      y = random(-500, -50);  // Reposicionar en la parte superior
      x = random(width);      // También cambiar la posición horizontal aleatoriamente
    }
  }
  
  // Método para dibujar el copo de nieve
  void show() {
    noStroke();  // Sin contorno
    fill(255);    // Color blanco para los copos
    ellipse(x, y, size, size);  // Dibujar el copo como un círculo
  }
}

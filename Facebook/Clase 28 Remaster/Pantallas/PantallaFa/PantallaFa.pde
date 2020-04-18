import processing.video.*;
import processing.serial.*;

PImage Boton, Pantalla1, Pantalla2, Pantalla3, Pantalla4, Pantalla5, Pantalla6, Pantalla7, Pantalla8, Pantalla9, Pantalla10;

int ancho = 150;
int alto = 150;
int x = 896;
int y = 575;
boolean unaVez = false;
int y1=0;
Movie video;

int stage;

void setup() {

  stage = 1;
  size (1920, 1080);

  Pantalla1 = loadImage("Pantalla1.jpg");
  Pantalla2 = loadImage("Pantalla2.jpg");
  Pantalla3 = loadImage("Pantalla3.jpg");
  Pantalla4 = loadImage("Pantalla4.jpg");
  Pantalla5 = loadImage("Pantalla5.jpg");
  Pantalla6 = loadImage("Pantalla6.jpg");
  Pantalla7 = loadImage("Pantalla7.jpg");
  Pantalla8 = loadImage("PantallaPrueba.jpg");
  Pantalla9 = loadImage("PantallaPrueba1.jpg");
  Boton = loadImage("Boton.png");
  
  video = new Movie(this, "VideosPrueba.mp4");
  video.play();
  //video.speed(4);
}

void movieEvent(Movie video){
  video.read();
}

void draw() {

  if (stage == 1) {
    image (Pantalla1, 0, 0);
    if (key == 'e') {
      stage = 2;
    }
  }

  if (stage == 2) {
    image (Pantalla2, 0, 0 );
    Pantalla2.resize(1380, 0);
    video.resize(500, 250);
    image(video,450,305);
    
    if (key == 'r') {
      stage = 3;
    }
  }

  if (stage == 3) {
    image (Pantalla3, 0, 0);
    image (Boton, x, y, ancho, alto);
    if (mousePressed == true)
    {
      if (mouseX >= x && mouseX <= x+ancho)
      {
        if (mouseY >= y && mouseY <= y+alto)
        {
          if (unaVez == false)
          {
            stage = 4;
            unaVez = true;
          }
        }
      }
    } else
    {
      unaVez = false;
    }
  }

  if (stage == 4) {
    Pantalla8.resize(1380, 0);
    image (Pantalla8, 0, y1);
    if (keyPressed == true) {
      if (key == 't') {
        image(Pantalla8, 0, y1 = y1 - 10);
      }
      if (key == 'h') {
        y1 = y1 + 10;
      }
      if (key == 'g') {
        stage = 5;
      }
    }
  }

  if (stage == 5) {
    image (Pantalla5, 0, 0 );
    if (key == 'y') {
      stage = 6;
    }
  }

  if (stage == 6) {
    image (Pantalla6, 0, 0 );
    if (key == 'u') {
      stage = 7;
    }
  }

  if (stage == 7) {
    image (Pantalla7, 0, 0 );
    if (key == 'i') {
      stage = 8;
    }
  }
}

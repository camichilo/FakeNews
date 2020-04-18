//-------------------------------------Librerias-----------------------------------
import processing.serial.*;
import processing.video.*;

import oscP5.*;

OscP5 oscP5tcpClient;
int datoServidor;
int firstValue;
//Serial port;

//-------------------------------------Variables-----------------------------------
PImage Pantalla1, Pantalla2, Pantalla5, Pantalla7, Pantalla7_1, Pantalla7_2, Pantalla7_3, Pantalla7_4, Pantalla7_5, Pantalla7_6, Pantalla7_7;
PImage Pantalla7_7_1, Pantalla7_7_2, Pantalla7_7_3, Pantalla7_7_4, Pantalla7_7_5, Pantalla7_7_6, Pantalla7_7_7, Pantalla10, Pantalla10_1, Pantalla11, Pantalla12;


int anchoBoton = 150;
int altoBoton  = 150;
int xB = 526, xB1 = 626, xB2 = 886; //626,886
int yB = 540, yB1 = 360, yB2 = 360; //360,360
boolean unaVez = false;
boolean unaVez2= false;

int y1=0;
int y2=0;
int y3=0;
int y4=0;
int y5=0;
int y6=0;
int y7=0;
int y8=0;
int w=0;
Movie video3;
int stage = 0;
Movie video2;
Movie video;
int score = 0;
//-------------------------------------Arduino---------------------------------
String sensores;
int retroceder;
int avanzar;
//-------------------------------------Setup-----------------------------------
void setup() {

  noStroke();
  //port = new Serial (this, "/dev/cu.usbmodem14331", 9600);

  stage = 1;
  size (1920, 1080);

  Pantalla1 = loadImage("Pantalla1.jpg");
  Pantalla2 = loadImage("Pantalla2.jpg");
  Pantalla5 = loadImage("Pantalla5.jpg");
  Pantalla7 = loadImage("Pantalla7.jpg");
  Pantalla7_1 = loadImage("Pantalla7_1.jpg");
  Pantalla7_2= loadImage("Pantalla7_2.jpg");
  Pantalla7_3 = loadImage("Pantalla7_3.jpg");
  Pantalla7_4 = loadImage("Pantalla7_4.jpg");
  Pantalla7_5 = loadImage("Pantalla7_5.jpg");
  Pantalla7_6 = loadImage("Pantalla7_6.jpg");
  Pantalla7_7_1= loadImage("Pantalla7_7_1.png");
  Pantalla7_7_2 = loadImage("Pantalla7_7_2.png");
  Pantalla7_7_3 = loadImage("Pantalla7_7_3.png");
  Pantalla7_7_4= loadImage("Pantalla7_7_4.png");
  Pantalla7_7_5= loadImage("Pantalla7_7_5.png");
  Pantalla7_7_6 = loadImage("Pantalla7_7_6.png");
  Pantalla10 = loadImage("Pantalla10.jpg");
  Pantalla10_1= loadImage("Pantalla10_1.jpg");
  Pantalla11= loadImage("Pantalla11.jpg");
  Pantalla12 = loadImage("Pantalla12.jpg");
  //192.168.54.240
  //192.166.0.8
  oscP5tcpClient = new OscP5(this, "192.168.0.5", 12000, OscP5.TCP);

  video = new Movie(this, "VideosPrueba.mp4");
  video2 =new Movie(this, "jonas.mp4");
  video3 =new Movie(this, "esperar.mp4");

  //video.speed(4);
}

//-------------------------------------MetodoVideo-----------------------------------
void movieEvent(Movie video) {
  video.read();
}

void movieEvent1(Movie video2) {
  video2.read();
}
void movieEvent2(Movie video3) {
  video3.read();
}
//----------------------------------------Draw---------------------------------------
void draw() {
  //println(score);
  //println(w);
  //println(stage);

  //--------------------------------------------------------------------------------------PantallaInicial-----------------------------------

  if (stage == 1) {
    image (Pantalla1, 0, 0);
    if (key == '1') {
      stage = 2;
    }
  }
  //--------------------------------------------------------------------------------------videoExplicacción-----------------------------------

  if (stage == 2) {
    video.play();
    image (Pantalla2, 0, 0);
    image(video, 690, 425, 500, 350);
    if (key == '2') {
      stage = 3;
    }
  }

  //--------------------------------------------------------------------------------------ExplicaciónUsuario-----------------------------------

  if (stage == 3) {
    video.stop();
    image (Pantalla5, 0, y1);
    if (key == '3') {
      stage = 4;
    }
  }

  //--------------------------------------------------------------------------------------Pagina Periodico-----------------------------------
  if (stage == 4) {
    video3.stop();
    //-------------------------------------NOTICIA-FONDO-----------------------------------
    image (Pantalla7, 0, y1);
    //-------------------------------------NOTICIA-SENADOR-----------------------------------
    image (Pantalla7_7_1, 400, y2);
    //-------------------------------------NOTICIA-CORONAVIRUS-----------------------
    image (Pantalla7_7_2, 400, y3);
    //-------------------------------------NOTICIA-PETROLEO-------------------
    image (Pantalla7_7_3, 400, y4);
    //-------------------------------------NOTICIAIMPUESTOALCARBON---------------------
    image (Pantalla7_7_4, 400, y5);
    //-------------------------------------NOTICIA-MENOPAUSA----------------------
    image (Pantalla7_7_5, 400, y6);
    //-------------------------------------NOTICIA-ANTARTIDA-------------------------------    
    image (Pantalla7_7_6, 400, y7);

    y2 = y1 + 500;
    y3 = y2 + 700;
    y4 = y3 + 700;
    y5 = y4 + 700;
    y6 = y5 + 700;
    y7 = y6 + 700;

    fill(#000000);
    textSize(80);
    text(score, 1790, 150);

    int l = 400;
    int n = 500;
    noFill();
    rect(l, n, 100, 100);

    if (key == '4') {
      stage = 5;
    }

    if (keyPressed == true) {
      if (key == 't'||key == 'T') {
        y1 = y1 - 10;
      }
      if (key == 'h'||key == 'H') {
        y1 = y1 + 10;
      }
      // ---------------------------------------------------Noticias
      if ( l == 400 && n >= y2 && n < y3) {
        if (key == 'q' || key == 'Q') {
          stage = 6;
          oscP5tcpClient.send("/noticia1", new Object[] {   
            new Integer("13")     } 
            );
          if (w == 1) {
            if (key == 'q' || key == 'Q') {
              stage = 13;
            }
          }
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 400 && n >= y3 && n < y4 ) {
        if (key == 'q' || key == 'Q') {
          stage = 7;
          oscP5tcpClient.send("/noticia1", new Object[] {   
            new Integer("13")     } 
            );
          if (w == 2) {
            if (key == 'q' || key == 'Q') {
              stage = 13;
            }
          }
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 400 && n >= y4 && n < y5 ) {
        if (key == 'q' || key == 'Q') {
          stage = 8;
          oscP5tcpClient.send("/noticia1", new Object[] {   
            new Integer("13")     } 
            );
          if (w == 3) {
            if (key == 'q' || key == 'Q') {
              stage = 13;
            }
          }
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 400 && n >= y5 && n < y6 ) {
        if (key == 'q' || key == 'Q') {
          stage = 9;
          oscP5tcpClient.send("/noticia1", new Object[] {   
            new Integer("13")     } 
            );
          if (w == 4) {
            if (key == 'q' || key == 'Q') {
              stage = 13;
            }
          }
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 400 && n >= y6 && n < y7 ) {
        if (key == 'q' || key == 'Q') {
          stage = 10;
          oscP5tcpClient.send("/noticia1", new Object[] {   
            new Integer("13")     } 
            );
          if (w == 5) {
            if (key == 'q' || key == 'Q') {
              stage = 13;
            }
          }
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 400 && n >= y7 && n < y7+700) {
        if (key == 'q' || key == 'Q') {
          stage = 11;
          oscP5tcpClient.send("/noticia1", new Object[] {   
            new Integer("13")     } 
            );
          if (w == 6) {
            if (key == 'q' || key == 'Q') {
              stage = 13;
            }
          }
        }
      }
    }
  }
  //--------------------------------------------------------------------------------------STAGE-5-----------------------------------

  if (score >= 160) {
    stage = 5;
  }

  if (stage == 5) {

    image (Pantalla10, 0, 0);
    fill(0, 0, 0);
    textSize(80);
    text(score, 1200, 640);

    if (key == 'q' || key == 'Q') {
      stage = 14;
    }
  }
  //--------------------------------------------------------------------------------------STAGE-6 SENADOR -----------------------------------
  if (stage == 6) {
    image(Pantalla7_2, 0, 0);
    video3.stop();
    if (keyPressed == true) {
      if (key == 'f'||key == 'F') 
      {
        oscP5tcpClient.send("/noticia1", new Object[] {   
          new Integer("1")     } 
          );
        if (unaVez == false)
        {
          stage=12;
          unaVez=true;
          w = 1;
        }
      }
    }
  }

  //--------------------------------------------------------------------------------------STAGE-7 CORONA VIRUS-----------------------------------  
  if (stage == 7) {
    image(Pantalla7_6, 0, 0);

    if (keyPressed == true) {
      if (key == 'f' || key == 'F') {
        oscP5tcpClient.send("/noticia1", new Object[] {   
          new Integer("2")     } 
          );
        if (unaVez == false)
        {
          stage=12;
          unaVez=true;
          w = 2;
        }
      }
    }
  }

  //--------------------------------------------------------------------------------------STAGE-8 PETROLIO-----------------------------------  
  if (stage == 8) {
    image(Pantalla7_1, 0, 0);

    if (keyPressed == true) {
      if (key == 'f' || key == 'F') {
        oscP5tcpClient.send("/noticia1", new Object[] {   
          new Integer("3")     } 
          );
        if (unaVez == false)
        {
          stage=12;
          unaVez=true;
          w = 3;
        }
      }
    }
  }
  //--------------------------------------------------------------------------------------STAGE-9 CARBON-----------------------------------  
  if (stage == 9) {
    image(Pantalla7_4, 0, 0);

    if (keyPressed == true) {
      if (key == 'f' || key == 'F') {
        oscP5tcpClient.send("/noticia1", new Object[] {   
          new Integer("4")     } 
          );
        if (unaVez == false)
        {
          stage=12;
          unaVez=true;
          w = 4;
        }
      }
    }
  }
  //--------------------------------------------------------------------------------------STAGE-10 NOTICIA-MENOPAUSA-----------------------------------  
  if (stage == 10) {
    image(Pantalla7_3, 0, 0);

    if (keyPressed == true) {
      if (key == 'f' || key == 'F') {
        oscP5tcpClient.send("/noticia1", new Object[] {   
          new Integer("5")     } 
          );
        if (unaVez == false)
        {
          stage=12;
          unaVez=true;
          w = 5;
        }
      }
    }
  }

  //--------------------------------------------------------------------------------------STAGE-11 aNTARTIDA----------------------------------  
  if (stage == 11) {
    image(Pantalla7_5, 0, 0);

    if (keyPressed == true) {
      if (key == 'f' || key == 'F') {
        oscP5tcpClient.send("/noticia1", new Object[] {   
          new Integer("6")     } 
          );
        if (unaVez == false)
        {
          stage=12;
          unaVez=true;
          w = 6;
        }
      }
    }
  } 
  //--------------------------------------------------------------------------------------STAGE-12 PANTALLA ESPERAR----------------------------------  

  if (stage == 12) {

    video3.play();
    image (Pantalla11, 0, 0);
    //println(datoServidor);
    image(video3, 690, 425, 500, 350);
    if (score >= 10) {
      stage = 4;
    }
  } 

  //---------------------------------------------------------------------------------------STAGE-13 PANTALLA DE ERROR POR ENVIO DE IMG-----------------------------------------------------

  if (stage == 13) {
    video3.stop();
    image (Pantalla7_7_6, 420, y2);
    if (key == 'q' || key == 'Q') {
      if (unaVez == false)
      {  
        stage = 4;
        unaVez=true;
      }
    }
  }

  if (stage == 14) {
    video2.play();
    image (Pantalla12, 0, 0);
    image (video2, 690, 425, 500, 350);
  }
}


void keyReleased() 
{
  unaVez=false;
}


void oscEvent(OscMessage theMessage) 
{  
  //recibe el primer mensaje enviado por el servidor  
  // int firstValue = theMessage.get(0).intValue();
  //imprime el primer mensaje enviado por el servidor
  //println(" servidor dice: "+firstValue);


  //si el cliente recibio el mensaje del servidor
  if (theMessage.checkAddrPattern("/Servidor"))
  {
    //recibe el dato del servidor
    //recibe el segundo mensaje enviado por el servidor
    datoServidor = theMessage.get(0).intValue();
    //imprime el segundo mensaje enviado por el servidor
    println(" noticia: "+datoServidor);
  }

  score = score + datoServidor;
  //println(score);
}

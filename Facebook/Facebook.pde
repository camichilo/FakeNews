//-------------------------------------Librerias-----------------------------------
import processing.serial.*;
import processing.video.*;

import oscP5.*;

OscP5 oscP5tcpClient;
int datoServidor1;
//Serial port;

//-------------------------------------Variables-----------------------------------
PImage Pantalla1, Pantalla2, Pantalla3, Pantalla6, Pantalla6_1, Pantalla6_2, Pantalla6_3, Pantalla6_4, Pantalla6_5, Pantalla6_6, Pantalla10, Pantalla10_1;
PImage Pantalla11, Pantalla12;
PFont font; 

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
int w=0;

int stage = 0;
Movie video;
Movie video2;
int score1 = 0;

int s=5;
int m=0;
int s1=59;
int m1=0;


//-------------------------------------Arduino---------------------------------
String sensores;
int retroceder;
int avanzar;


//-------------------------------------Setup-----------------------------------
void setup() {

  noStroke();
  // port = new Serial (this, "localhost", 9600);

  stage = 1;
  size (1920, 1080);

  Pantalla1 = loadImage("Pantalla1.jpg");
  Pantalla2 = loadImage("Pantalla2.jpg");
  Pantalla3 = loadImage("Pantalla3.jpg");
  Pantalla6 = loadImage("Pantalla6.jpg");
  Pantalla6_1 = loadImage("Pantalla6_1.png");
  Pantalla6_2 = loadImage("Pantalla6_2.png");
  Pantalla6_3 = loadImage("Pantalla6_3.png");
  Pantalla6_4 = loadImage("Pantalla6_4.png");
  Pantalla6_5 = loadImage("Pantalla6_5.png");
  Pantalla6_6 = loadImage("Pantalla6_6.png");
  Pantalla6_6 = loadImage("Pantalla6_6.png");
  Pantalla10 = loadImage("Pantalla10.jpg");
  Pantalla10_1 = loadImage("Pantalla10_1.jpg");
  Pantalla11 = loadImage("Pantalla11.jpg");
  Pantalla12 = loadImage("Pantalla12.jpg");
  //192.168.0.7
  oscP5tcpClient = new OscP5(this, "localhost", 12000, OscP5.TCP);
  
  //Comento esto ya que contiene el video que no deja subir a github
  //video = new Movie(this, "VideosPrueba.mp4");

  // video.speed(4);
}

void movieEvent(Movie video) {
  video.read();
}
//----------------------------------------Draw---------------------------------------
void draw() {
  println(score1);

  //---------------Arduino Puerto---------------- 
  /* if (0 < port.available()) 
   {     
   //otra forma de enviar los datos a processing es no usando serial.write, sino serial.println, sin embargo en processing no se utiliza port.read(), sino port.readStringUntil('\n');
   sensores =  port.readStringUntil('\n');    
   
   if (sensores != null)
   {
   println(sensores);
   //se crea un arreglo que divide los datos y los guarda dentro del arreglo, para dividir los datos se hace con split cuando le llegue el caracter 'T',
   String[] datosSensor = split(sensores, 'T');
   
   if (datosSensor.length == 2)
   {
   println(datosSensor[0]);
   println(datosSensor[1]);
   retroceder = int(trim(datosSensor[0]));      
   avanzar = int(trim(datosSensor[1]));
   }
   }
   }*/
  //------------------Estados-----------------

  //Prueba
  if (stage == 1) {
    //Pantalla1.resize(1380, 0);
    image (Pantalla1, 0, 0);
    if (key == '1') {
      stage = 2;
    }
  }
  //---------------------------estado2----------------

  if (stage == 2) {
    video.play(); 
    image (Pantalla2, 0, 0);
    image(video, 690, 425, 500, 350);
    if (key == '2') {
      stage = 3;
    }
  }

  //---------------------------estado3----------------

  if (stage == 3) {
    video.stop();
    image (Pantalla3, 0, y1);
    if (key == '3') {
      stage = 4;
    }
  }

  //---------------------------estado4 - Página Facebook----------------
  if (stage == 4) {
    //-------------------------------------NOTICIA-FONDO-----------------------------------
    image(Pantalla6, 0, y1);
    //-------------------------------------NOTICIA-ACADEMIAESPAÑOLA-----------------------------------    
    image(Pantalla6_1, 335, y2);
    //-------------------------------------NOTICIA-CARTAGENA------------------------------------
    image(Pantalla6_2, 335, y3);
    //-------------------------------------NOTICIA-MANIFESTANTES------------------------------------
    image(Pantalla6_3, 335, y4);
    //-------------------------------------NOTICIA-CICLISMO-----------------------------------    
    image(Pantalla6_4, 335, y5);
    //-------------------------------------NOTICIA-DeONE-----------------------------------    
    image(Pantalla6_5, 335, y6);
    //-------------------------------------NOTICIA-WAZE-----------------------------------    
    image(Pantalla6_6, 335, y7);

    y2 = y1 + 520;
    y3 = y2 + 1040;
    y4 = y3 + 1040;
    y5 = y4 + 1040;
    y6 = y5 + 1040;
    y7 = y6 + 1040;

    fill(#000000);
    textSize(80);
    text(score1, 1790, 150);

    int l = 335;
    int n = 550;
    //fill(255, 0, 0);
    rect(l, n, 100, 100);

    if (key == '4') {
      stage=5;
    }

    if (keyPressed == true) {
      if (key == 't'||key=='T') {

        y1 = y1 - 10;
      }
      if (key == 'h'||key=='H') {
        y1 = y1 + 10;
      }


      // ---------------------------------------------------Noticias
      if ( l == 335 && n >= y2 && n < y3) {
        if (key == 'q' || key == 'Q') {
          stage = 12;
          oscP5tcpClient.send("/noticia2", new Object[] {   
            new Integer("7")     } 
            );
          /*if (w == 1) {
            if (key == 'q' || key == 'Q') {
              oscP5tcpClient.send("/noticia2", new Object[] {   
                new Integer("14")     } 
                );
              stage = 13;
            }
          }*/
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 335 && n >= y3 && n < y4 ) {
        if (key == 'q' || key == 'Q') {
          stage = 12;
          oscP5tcpClient.send("/noticia2", new Object[] {   
            new Integer("8")     } 
            );
          oscP5tcpClient.send("/noticia1", new Object[] {   
            new Integer("13")     } 
            );
          if (w == 2) {
            if (key == 'q' || key == 'Q') {
              oscP5tcpClient.send("/noticia2", new Object[] {   
                new Integer("14")     } 
                );
              stage = 13;
            }
          }
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 335 && n >= y4 && n < y5 ) {
        if (key == 'q' || key == 'Q') {
          stage = 12;
          oscP5tcpClient.send("/noticia2", new Object[] {   
            new Integer("9")     } 
            );

          /*if (w == 3) {
            if (key == 'q' || key == 'Q') {
              oscP5tcpClient.send("/noticia2", new Object[] {   
                new Integer("14")     } 
                );
              stage = 13;
            }
          }*/
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 335 && n >= y5 && n < y6 ) {
        if (key == 'q' || key == 'Q') {
          stage = 12;
          oscP5tcpClient.send("/noticia2", new Object[] {   
            new Integer("10")     } 
            );

          if (w == 4) {
            if (key == 'q' || key == 'Q') {
              oscP5tcpClient.send("/noticia2", new Object[] {   
                new Integer("14")     } 
                );
              stage = 13;
            }
          }
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 335 && n >= y6 && n < y7 ) {
        if (key == 'q' || key == 'Q') {
          stage = 12;
          oscP5tcpClient.send("/noticia2", new Object[] {   
            new Integer("11")     } 
            );

          if (w == 5) {
            if (key == 'q' || key == 'Q') {
              oscP5tcpClient.send("/noticia2", new Object[] {   
                new Integer("14")     } 
                );
              stage = 13;
            }
          }
        }
      }
      // ---------------------------------------------------Noticias
      if ( l == 335 && n >= y7 && n < y7+1040) {
        if (key == 'q' || key == 'Q') {
          stage = 12;
          oscP5tcpClient.send("/noticia2", new Object[] {   
            new Integer("12")     } 
            );
          if (w == 6) {
            if (key == 'q' || key == 'Q') {
              oscP5tcpClient.send("/noticia2", new Object[] {   
                new Integer("14")     } 
                );
              stage = 13;
            }
          }
        }
      }
    }
  }

  //------------------------------------------------------------
  if (stage == 6) {
    stage=12;
    w = 1;
  }

  //-----------------------------------------------------------------
  /*if (stage == 5) {
   //Pantalla7.resize(1380, 0);
   image (Pantalla11, 0, 0);
   //video.resize(500, 250);
   image(video, 690, 425, 500, 350);
   //resta de tiempo
   textAlign(RIGHT);
   textSize(30);
   stroke(255);
   delay(1000);
   
   if (s<=5) {
   text(m+":"+s, 1890, 150);
   s=s-1;
   } else {
   m=0;
   s=s-1;
   text(m+":"+s, 1890, 150);
   }
   if (s == 0) {
   stage = 3;
   s=s+5;
   }
   }*/


  //---------------------------estado11----------------
  if (stage == 7) {
    image (Pantalla10, 0, 0);
    if (key == '6') {
      stage = 8;
    }
  }




  //---------------------------estado12----------------
  if (stage == 8) {
    video.play(); 
    image (Pantalla12, 0, 0);
    image(video, 690, 425, 500, 350);
  }

  if (stage == 12) {
    image (Pantalla11, 0, 0);
    if (score1 >= 20) {
      stage = 4;
    }
  }

  if (stage == 13) {
    image (Pantalla6_6, 420, y2);
    if (key == 'q' || key == 'Q') {
      if (unaVez == false)
      {  
        stage = 4;
        unaVez=true;
      }
    }
  }
}
/* textAlign(RIGHT);
 textSize(60);
 stroke(#000000);
 delay(1000);
 
 if (s1<=59) {
 text(m+":"+s, 1890, 100);
 s1=s1-1;
 } else {
 m1=0;
 s1=s1-1;
 text(m1+":"+s1, 1890, 140);
 }
 if (s1 == 0) {
 stage =12 ;
 }*/


//video.resize(500, 250);
//image(video, 450, 305);

void keyReleased() 
{
  unaVez=false;
}

//---------------------Cliente---------------------------------

void oscEvent(OscMessage theMessage) 
{  
  //recibe el primer mensaje enviado por el servidor  
  //int firstValue = theMessage.get(0).intValue();
  //imprime el primer mensaje enviado por el servidor
  //println(" servidor dice: "+firstValue);


  //si el cliente recibio el mensaje del servidor
  if (theMessage.checkAddrPattern("/Servidor1"))
  {
    //recibe el dato del servidor
    //recibe el segundo mensaje enviado por el servidor
    datoServidor1 = theMessage.get(0).intValue();
    //imprime el segundo mensaje enviado por el servidor
    println(" noticia2: "+datoServidor1);
  }

  score1 = score1 + datoServidor1;
  //println(score);
}

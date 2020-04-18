//------------------------------------------Librerias----------------------------------------//
import processing.serial.*;
import processing.video.*;
import oscP5.*;
import processing.sound.*;
SoundFile file;

OscP5 oscP5tcpServer;
int datoCliente1;
int datoCliente2;
//Serial port;

//-------------------------------------Variables-----------------------------------
PImage Pantalla1, Pantalla2, Pantalla3, Pantalla4, Pantalla5, Pantalla6, Pantalla6_0, Pantalla6_1, Pantalla6_2, Pantalla6_3;
PImage Pantalla6_4, Pantalla6_5, Pantalla6_6, Pantalla7, Pantalla7_1, Pantalla7_2, Pantalla7_3, Pantalla7_4, Pantalla7_5;
PImage Pantalla7_6, Pantalla7_7_1, Pantalla7_7_2, Pantalla7_7_3, Pantalla7_7_4, Pantalla7_7_5, Pantalla7_7_6, Pantalla8;
PImage Pantalla8_1, Pantalla8_2, Pantalla8_3, Pantalla8_4, Pantalla8_5, Pantalla8_6, Pantalla8_7, Pantalla8_8, Pantalla8_9;
PImage Pantalla8_10, Pantalla8_11, Pantalla8_12, Pantalla9, Pantalla10, Pamtalla10_1, Pantalla11, Pantalla12;

int anchoBoton = 762;
int altoBoton  = 216;
int xB = 50, xB1 = 50; //xB2 = 886; 626,886
int yB = 300, yB1 = 550; //yB2 = 360; 360,360
//boolean unaVez = false;
//boolean unaVez2= false;

int y1=0;
int noticia1=0;
int stage;
int score;
int score1;
boolean unaVez = true;
boolean x = true;

int ContadorEnvio = 0;
int ContadorEnvio1 = 0;
Movie video;
Movie video2;

//-------------------------------------Setup-----------------------------------
void setup() {

  noStroke();
  //port = new Serial (this, "/dev/cu.usbmodem14331", 9600);

  stage = 1;
  size (1920, 1080);

  Pantalla1 = loadImage("Pantalla1.jpg");
  Pantalla2 = loadImage("Pantalla2.jpg");
  Pantalla4 = loadImage("Pantalla4.jpg");
  Pantalla8 = loadImage("Pantalla8.jpg");
  Pantalla8_1 = loadImage("Pantalla8_1.png");
  Pantalla8_2 = loadImage("Pantalla8_2.png");
  Pantalla8_3 = loadImage("Pantalla8_3.png");
  Pantalla8_4 = loadImage("Pantalla8_4.png");
  Pantalla8_5 = loadImage("Pantalla8_5.png");
  Pantalla8_6 = loadImage("Pantalla8_6.png");
  Pantalla8_7 = loadImage("Pantalla8_7.png");
  Pantalla8_8 = loadImage("Pantalla8_8.png");
  Pantalla8_9 = loadImage("Pantalla8_9.png");
  Pantalla8_10 = loadImage("Pantalla8_10.png");
  Pantalla8_11 = loadImage("Pantalla8_11.png");
  Pantalla8_12 = loadImage("Pantalla8_12.png");
  Pantalla9 = loadImage("Pantalla9.jpg");
  Pantalla11 = loadImage("Pantalla11.jpg");
  Pantalla12 = loadImage("Pantalla12.jpg");

  oscP5tcpServer = new OscP5(this, 12000, OscP5.TCP);

  video = new Movie(this, "VideosPrueba.mp4");                        
  video2 = new Movie(this, "espera.mp4");


  //video.speed(4);
}

//-------------------------------------MetodoVideo-----------------------------------
void movieEvent(Movie video) {
  video.read();
}
void movieEvent1(Movie video2) {
  video2.read();
}
//----------------------------------------Draw---------------------------------------

void draw() {
  println(ContadorEnvio);
  if (stage == 1) {
    //Pantalla1.resize(1380, 0);
    image (Pantalla1, 0, 0);
    if (key == '1') {
      stage = 2;
    }
  }

  if (stage == 2) {
    video.play();
    //Pantalla2.resize(1380, 0);

    image(video, 0, 0);
    if (key == '2') {
      stage = 3;
    }
  }

  if (stage == 3) {
    video.stop();
    image (Pantalla4, 0, 0);
    if (key == '3') {
      stage = 4;
    }
  }

  if (datoCliente1 == 13) {
    stage = 4;
  }

  if (datoCliente2 == 14) {
    stage = 4;
  }

  if (stage == 4) {


    image (Pantalla8, 0, 0);

    if (datoCliente1 == 1) {
      image (Pantalla8_6, xB, yB, anchoBoton, altoBoton);
    }
    if (datoCliente1 == 2) {
      image (Pantalla8_11, xB, yB, anchoBoton, altoBoton);
    }

    if (datoCliente1 == 3) { 
      image (Pantalla8_9, xB, yB, anchoBoton, altoBoton);
    }

    if (datoCliente1 == 4) {
      image (Pantalla8_5, xB, yB, anchoBoton, altoBoton);
    }

    if (datoCliente1 == 5) {
      image (Pantalla8_10, xB, yB, anchoBoton, altoBoton);
    }

    if (datoCliente1 == 6) {
      image (Pantalla8_3, xB, yB, anchoBoton, altoBoton);
    }


    if (datoCliente2 == 7) {
      image (Pantalla8_12, xB1, yB1, anchoBoton, altoBoton);
    }

    if (datoCliente2 == 8) {
      image (Pantalla8_1, xB1, yB1, anchoBoton, altoBoton);
    }

    if (datoCliente2 == 9) {
      image (Pantalla8_4, xB1, yB1, anchoBoton, altoBoton);
    }

    if (datoCliente2 == 10) {
      image (Pantalla8_8, xB1, yB1, anchoBoton, altoBoton);
    }

    if (datoCliente2 == 11) {
      image (Pantalla8_2, xB1, yB1, anchoBoton, altoBoton);
    }

    if (datoCliente2 == 12) {
      image (Pantalla8_3, xB1, yB1, anchoBoton, altoBoton);
    }
  }

  if (stage == 5) {      
    
    image (Pantalla11,0,0);
    //image(video2, 0, 0); 
    if (key == '5') {
      stage = 6;
    }
  }


  if (stage == 6) {
    image (Pantalla9, 0, 0);
  }

  if (stage == 7) {
    //Pantalla1.resize(1380, 0);
    image (Pantalla12, 0, 0);
  }

  //-------------------------------------------------------------------- Prueba Reinicio
}

void keyPressed() {

  if (stage == 4) {
    if (key == 'o' || key == 'O') {
      oscP5tcpServer.send("/Servidor", new Object[] {   
        new Integer("10") }
        );
      ContadorEnvio = ContadorEnvio + 10;
      if (ContadorEnvio >= 10) {
        stage = 5;
      }
    } 
    if (key == 'o' || key == 'O') {
      oscP5tcpServer.send("/Servidor1", new Object[] {   
        new Integer("10") }
        );
    }

    if (key == 'p' || key == 'P') {
      oscP5tcpServer.send("/Servidor", new Object[] {   
        new Integer("10") }
        );
      ContadorEnvio = ContadorEnvio +10;
      if (ContadorEnvio >= 10) {
        stage = 5;
      }
    }
    if (key == 'p' || key == 'P') {
      oscP5tcpServer.send("/Servidor", new Object[] {   
        new Integer("10") }
        );
    }
  }
}


//cuando ocurre un evento osc---------------------------------------------------
void oscEvent(OscMessage theMessage) 
{

  //si el servidor recibio el mensaje del cliente
  if (theMessage.checkAddrPattern("/noticia1")) 
  {
    //recibe el dato de lcliente 1
    //recibe el segundo mensaje enviado por el cliente  
    datoCliente1 = theMessage.get(0).intValue();
    //imprime el segundo mensaje enviado por el cliente
    println(" noticia: "+ datoCliente1);

    //Envia el dato del cliente 1 --------------------------------------------------------------------
    OscMessage m = new OscMessage("");
    //el servidor le dice al cliente que si recibio el mensaje
    m.add(0);

    //el servidor le ENVIA EL MENSAJE AL CLIENTE
    oscP5tcpServer.send(m, theMessage.tcpConnection());
  }

  //si el servidor recibio el mensaje de la noticia1
  if (theMessage.checkAddrPattern("/noticia2"))
  {
    //recibe el dato del cliente 2
    //recibe el segundo mensaje enviado por el cliente
    datoCliente2 = theMessage.get(0).intValue();
    //imprime el segundo mensaje enviado por el cliente
    println( " noticia: "+datoCliente2);

    //Envia el dato del cliente 2 --------------------------------------------
    OscMessage n = new OscMessage("");
    //el servidor le dice al cliente que si recibio el mensaje
    n.add(0);

    //el servidor le ENVIA EL MENSAJE AL CLIENTE
    oscP5tcpServer.send(n, theMessage.tcpConnection());
  }
}

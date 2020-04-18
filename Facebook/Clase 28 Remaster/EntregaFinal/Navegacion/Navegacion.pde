//-------------------------------------Librerias-----------------------------------
import processing.serial.*;
import processing.video.*;
import oscP5.*;

OscP5 oscP5tcpClient;



Serial port;

//-------------------------------------Variables-----------------------------------
PImage Pantalla1, Pantalla2, Pantalla3, Pantalla4, Pantalla4_1, Pantalla5, Pantalla5_1;
PImage Pantalla6, Pantalla6_1, Pantalla6_2, Pantalla6_3, Pantalla6_4, Pantalla6_5;
PImage Pantalla6_6, Pantalla6_7, Pantalla7, Boton, Boton1, Boton2;

int anchoBoton = 150;
int altoBoton  = 150;
int xB = 356, xB1 = 626, xB2 = 886;
int yB = 360, yB1 = 360, yB2 = 360;
boolean unaVez = false;

int y1=0;
int stage = 0;


int score = 0;//Cliente_servidor
Movie video;

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
  Pantalla3 = loadImage("Pantalla3.jpg");
  Pantalla4 = loadImage("Pantalla4.jpg");
  Pantalla4_1 = loadImage("Pantalla4_1.jpg");
  Pantalla5 = loadImage("Pantalla5.jpg");
  Pantalla5_1 = loadImage("Pantalla5_1.jpg");
  Pantalla6 = loadImage("Pantalla6.jpg");
  Pantalla6_1 = loadImage("Pantalla6_1.jpg");
  Pantalla6_2 = loadImage("Pantalla6_2.jpg");
  Pantalla6_3 = loadImage("Pantalla6_3.jpg");
  Pantalla6_4 = loadImage("Pantalla6_4.jpg");
  Pantalla6_5 = loadImage("Pantalla6_5.jpg");
  Pantalla6_6 = loadImage("Pantalla6_6.jpg");
  Pantalla6_7 = loadImage("Pantalla6_7.jpg");
  Pantalla7 = loadImage("Pantalla7.jpg");
  Boton = loadImage("Boton.png");
  Boton1 = loadImage("Boton1.png");
  Boton2 = loadImage("Boton2.png");

  video = new Movie(this, "VideosPrueba.mp4");
  video.play();
  //video.speed(4);
  
  //Conexion al servidor
   oscP5tcpClient = new OscP5(this, "localhost", 12000, OscP5.TCP);
}

//-------------------------------------MetodoVideo-----------------------------------
void movieEvent(Movie video) {
  video.read();
}

//----------------------------------------Draw---------------------------------------
void draw() {
 background(100);  
  fill(255);
  strokeWeight(255);
  text(score,0,0);
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

  /*Prueba
   if (stage==0 )
   {
   Pantalla1.resize(1380, 0);
   image (Pantalla1, 0, 0);
   
   if (unaVez == false)
   {
   if (avanzar==1)
   {
   stage = 1; 
   unaVez = true;
   }
   }
   }
   
   if (stage==1) 
   {
   Pantalla2.resize(1380, 0);
   image (Pantalla2, 0, 0);
   video.resize(500, 250);
   image(video,450,305);
   
   if (unaVez==true) {
   if (retroceder == 0){
   stage = 0;
   unaVez = false;
   }
   }
   
   if (unaVez==false)
   {
   if (avanzar == 1)
   {
   stage = 2;
   unaVez = true;
   }
   }
   }
   
   if (stage==2) {
   Pantalla3.resize(1380, 0);
   image (Pantalla3, 0, 0);
   image (Boton, xB, yB, anchoBoton, altoBoton);
   image (Boton1, xB1, yB1, anchoBoton, altoBoton);
   image (Boton2, xB2, yB2, anchoBoton, altoBoton);
   
   if (unaVez == true){
   if(retroceder == 1){
   stage = 1;
   unaVez = false;
   }
   }
   }
   */
  //Fin Prueba
  if (stage == 1) {
    //Pantalla1.resize(1380, 0);
    image (Pantalla1, 0, 0);
    if (key == '1') {
      stage = 2;
    }
  }

  if (stage == 2) {
    //Pantalla2.resize(1380, 0);
    image (Pantalla2, 0, 0);
    video.resize(500, 250);
    image(video, 660, 505);
    if (key == '2') {
      stage = 3;
    }
  }


  if (stage == 3) {
    //Pantalla4.resize(1380, 0);
    image (Pantalla4, 0, y1);
    if (keyPressed == true) {
      if (key == 't'||key=='T') {
        image(Pantalla4, 0, y1 = y1 - 10);
      }
      if (key == 'h'||key=='H') {
        y1 = y1 + 10;
      }
      if (key == '3') {
        stage = 5;
      }
    }
  }

  if (stage == 5) {
    //Pantalla4_1.resize(1380, 0);
    image (Pantalla4_1, 0, 0);
    if (key == '4') {
      stage = 10;
    }
  }

  if (stage == 6) {
    //Pantalla5.resize(1380, 0);
    image (Pantalla5, 0, y1);
    if (keyPressed == true) {
      if (key == 't') {
        image(Pantalla5, 0, y1 = y1 - 2);
      }
      if (key == 'h') {
        y1 = y1 + 2;
      }
      if (key == '5') {
        stage = 7;
      }
    }
  }

  if (stage == 7) {
    //Pantalla5_1.resize(1380, 0);
    image (Pantalla5_1, 0, 0);
    if (key == '6') {
      stage = 10;
    }
  }

  if (stage == 8) {
    //Pantalla6.resize(1380, 0);
    image (Pantalla6, 0, y1);
    if (keyPressed == true) {
      if (key == 't') {
        image(Pantalla6, 0, y1 = y1 - 5);
      }
      if (key == 'h') {
        y1 = y1 + 5;
      }
      if (key == '7') {
        stage = 9;
      }
    }
  }

  if (stage == 9) {
    //Pantalla6_1.resize(1380, 0);
    image (Pantalla6_1, 0, 0);
    if (key == '8') {
      stage = 10;
    }
  }

  if (stage == 10) {
    //Pantalla7.resize(1380, 0);
    image (Pantalla7, 0, 0);
    video.resize(500, 250);
    image(video, 450, 305);
    if (key == '7') {
      stage = 9;
    }
  }
}
//Accion de envio de pantallas
/*void mousePressed() 
{
  //el cliente envia mensajes al servidor si este esta conectado
  oscP5tcpClient.send("/noticia1", new Object[] {   
     new Integer("1")     } 
  );
}

void oscEvent(OscMessage theMessage) 
{  
  //recibe el primer mensaje enviado por el servidor  
  int firstValue = theMessage.get(0).intValue();
  //imprime el primer mensaje enviado por el servidor
  println(" servidor dice: "+firstValue);
  
  score = score + firstValue;
println(score);
}*/

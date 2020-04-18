
//--------------------------librerias------------------------------
import oscP5.*;

OscP5 oscP5tcpServer;

int datoCliente1;
int datoCliente2;
//-----------------------------variables---------------------------
PImage Pantalla1, Pantalla2, Pantalla3, Pantalla4, Pantalla4_1, Pantalla5, Pantalla5_1;
PImage Pantalla6, Pantalla6_1, Pantalla6_2, Pantalla6_3, Pantalla6_4, Pantalla6_5;
PImage Pantalla6_6, Pantalla6_7, Pantalla7, Boton, Boton1, Boton2;

int noticia1=0;
//-----------------------------Setup-------------------------------
void setup() 
{
  size(1920,1080);
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
  //creo un servidor con puerto 12000 
  oscP5tcpServer = new OscP5(this, 12000, OscP5.TCP);
}


void draw() 
{
  background(0);  
 // 
  if(datoCliente1==1)
  {
     image(Pantalla5_1,0,0);
    
  }
  image(Boton2,0,0);
}





//cuando ocurre un evento osc
void oscEvent(OscMessage theMessage) 
{

  //si el servidor recibio el mensaje del cliente
  if(theMessage.checkAddrPattern("/noticia1")) 
  {
    //recibe el dato de lcliente 1
    //recibe el segundo mensaje enviado por el cliente  
    datoCliente1 = theMessage.get(0).intValue();
    //imprime el segundo mensaje enviado por el cliente
    println(" noticia: "+ datoCliente1);
    
    //Envia el dato del cliente 1
    OscMessage m = new OscMessage("");
    //el servidor le dice al cliente ke si recibio el mensaje
    m.add(20);

    //el servidor le ENVIA EL MENSAJE AL CLIENTE
    oscP5tcpServer.send(m,theMessage.tcpConnection());
  }
  
  if(theMessage.checkAddrPattern("/noticia2")) 
  {
    //recibe el dato de lcliente 1
    //recibe el segundo mensaje enviado por el cliente  
    datoCliente2 = theMessage.get(0).intValue();
    //imprime el segundo mensaje enviado por el cliente
    println(" noticia: "+ datoCliente2);
    
    //Envia el dato del cliente 1
    OscMessage m = new OscMessage("");
    //el servidor le dice al cliente ke si recibio el mensaje
    m.add(1);

    //el servidor le ENVIA EL MENSAJE AL CLIENTE
    oscP5tcpServer.send(m,theMessage.tcpConnection());
  }
}

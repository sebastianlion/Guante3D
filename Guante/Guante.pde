import processing.serial.*;
PImage fondo,mu,pincel,titulo,barra, fondo1;
int r,g,b,x,y,z,u,c=0,t,bb,dib,cubo, roll, pitch;
String dato;  
int mouseX_ant=700, mouseY_ant=200; //rangos en los que empiezan los ejes en el acelerometro
Serial myPort;
void setup()
{
  size(1200,650,P3D);
  background(255);
 
  myPort= new Serial(this,Serial.list()[0],9600);
  myPort.clear();
  
  fondo=loadImage("fondo1.jpg");
  mu=loadImage("mu.png");
  pincel=loadImage("pincel.png");
  titulo=loadImage("titulo.png");
  barra=loadImage("barra.png");
  fondo1=loadImage("fondo2.jpg");
  myPort.bufferUntil('\n');
}
void draw()
{
//fondo de la interfaz
image(fondo1, 0, 550,1200,100);
image(fondo, 0, 0,250,550);
fill(0);
rect(80,50,100,550);
image(titulo, 90,120,750,220);
image(mu, 50,300,200,300);
image(pincel, 20,400,100,200);
image(barra, 70,510,1180,150);
//colores
  ellipse(300,590,30,30); //color negro
   fill(255,0,0);
  ellipse(350,590,30,30);// color rojo
   fill(255,255,0); 
  ellipse(400,590,30,30); //color amarillo
   fill(128,128,0);
  ellipse(450,590,30,30); //color marron
   fill(0,255,0);
  ellipse(500,590,30,30);// color verde lima
   fill(0,128,0);
  ellipse(550,590,30,30);//color verde
   fill(0,255,255);
  ellipse(600,590,30,30);//color aqua
   fill(0,128,128);
  ellipse(650,590,30,30);// color teal
   fill(0,0,255);
  ellipse(700,590,30,30);// color azul
   fill(0,0,128);
  ellipse(750,590,30,30);//color azul oscuro
   fill(255,0,255);
  ellipse(800,590,30,30);//color fuchsia
   fill(128,0,128);
  ellipse(850,590,30,30);//color purpura
   fill(128,128,128);
  ellipse(900,590,30,30);//color gris
   fill(255,87,51);
  ellipse(950,590,30,30);//color naranja
   fill(255,160,122);
  ellipse(1000,590,30,30);//color rosado
   fill(255);
  ellipse(1050,590,30,30);//borrador

  //Cubo
 if(cubo==0)
    {
     background(255);
     pushMatrix(); 
     translate(width/2, 300);
     rotateX(x*PI/180.0);
     rotateY(y*PI/180.0);
    
     scale(100);
  beginShape(QUADS);

  fill(0, 255, 0); vertex(-1,  1,  1);
  fill(0, 255, 0); vertex( 1,  1,  1);
  fill(0, 255, 0); vertex( 1, -1,  1);
  fill(0, 255, 0); vertex(-1, -1,  1);

  fill(0, 255, 255); vertex( 1,  1,  1);
  fill(0, 255, 255); vertex( 1,  1, -1);
  fill(0, 255, 255); vertex( 1, -1, -1);
  fill(0, 255, 255); vertex( 1, -1,  1);


  fill(255, 0, 255); vertex( 1,  1, -1);
  fill(255, 0, 255); vertex(-1,  1, -1);
  fill(255, 0, 255); vertex(-1, -1, -1);
  fill(255, 0, 255); vertex( 1, -1, -1);

  fill(255, 255, 0); vertex(-1,  1, -1);
  fill(255, 255, 0); vertex(-1,  1,  1);
  fill(255, 255, 0); vertex(-1, -1,  1);
  fill(255, 255, 0); vertex(-1, -1, -1);


  fill(255, 0, 0); vertex(-1,  1, -1);
  fill(255, 0, 0); vertex( 1,  1, -1);
  fill(255, 0, 0); vertex( 1,  1,  1);
  fill(255, 0, 0); vertex(-1,  1,  1);


  fill(0, 0, 255); vertex(-1, -1, -1);
  fill(0, 0, 255); vertex( 1, -1, -1);
  fill(0, 0, 255); vertex( 1, -1,  1);
  fill(0, 0, 255); vertex(-1, -1,  1);

  endShape();

  popMatrix(); 
     
     
    }
  
 //Dibujar
 if(dib==0){
 if( (x > 270 && x < 1200 ) && (y > 0 && y < 551) )
     {
       translate(x+150,y);
     fill(r,g,b); 
     //line(mouseX_ant, mouseY_ant, x, y);
     //mouseX_ant = x;
     //mouseY_ant = y;
     rect(5,5,5,5);
     
     }  
   stroke(0);
 }
    //Borrador
 if(bb==1)
  {  
   fill(255);
   background(255);
  }
}
//Evento
void serialEvent(Serial myPort){
     dato = myPort.readString().trim();
     String[] list= split(dato,',');
     
     t=list.length;
   
    if(t==8){
   //declarar variables espacilaes y de color
    x = int(list[0]);
    y = int(list[1]);
    u= int(list[2]);
    bb= int(list[3]);
    cubo=int(list[4]);
    dib= int(list[5]);
    pitch= int(list[6]);
    roll= int(list[7]);
    //seleccionar colores
   if( u==1){
    //color negro
    if(c==0){
     r=0; 
     g=0;
     b=0;
    }
    //color rojo
   else if(c==1)
     {
   r=255;
   g=0;
   b=0;
    }
    //color amarillo
   else if(c==2){
   r=255;
   g=255;
   b=0;
     }
   //color marron
  else if(c==3)
  {
  r=128; 
  g=128;
  b=0;
  } 
 //color verde lima
  else if(c==4){
  r=0; 
  g=255;
  b=0;
 } 
 //color verde
 else if(c==5){
  r=0; 
  g=128;
  b=0;
 }
  //color aqua
 else if(c==6){
  r=0; 
  g=255;
  b=255;
 }
  //color teal
 else if(c==7){
  r=0; 
  g=128;
  b=128;
 }
 //color azul
 else if(c==8){
  r=0; 
  g=0;
  b=255;
 }
 //color azul oscuro
 else if(c==9){
  r=0; 
  g=0;
  b=128;
 }
//color fuchsia
 else if(c==10){
  r=255; 
  g=0;
  b=255;
 }
//color purpura
 else if(c==11){
  r=128; 
  g=0;
  b=128;
 }
//color gris
 else if(c==12){
  r=128; 
  g=128;
  b=128;
 }
//color naranja
 else if(c==13){
  r=255; 
  g=87;
  b=51;
 }
 //color rosado
 else if(c==14){
  r=255; 
  g=160;
  b=122;
  c=-1;
 }
 
  c++;
 } //final if colores
 
 }
}
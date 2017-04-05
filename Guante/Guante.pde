PImage fondo,mu,pincel,titulo,barra;
void setup()
{
  size(1200,650);
  fondo=loadImage("fondo1.jpg");
  mu=loadImage("mu.png");
  pincel=loadImage("pincel.png");
  titulo=loadImage("titulo.png");
  barra=loadImage("barra.png");
}
void draw()
{
//fondo de la interfaz
image(fondo, 0, 0,1200,650);
fill(255,255,255);
rect(250,50,895,500);
fill(0,0,0);
rect(80,50,100,500);
image(titulo, 90,120,750,220);
image(mu, 50,300,200,300);
image(pincel, 20,400,100,200);
image(barra, 70,510,1180,150);
//colores
ellipse(300,590,30,30); //color rojo
   fill(128,0,0);
  ellipse(350,590,30,30);// color marron
   fill(255,255,0); 
  ellipse(400,590,30,30); //color amarillo
   fill(128,128,0);
  ellipse(450,590,30,30); //color verde oliva
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
   fill(255,0,255);
  ellipse(850,590,30,30);//color purpura
   fill(128,0,128);
  ellipse(900,590,30,30);//color negro
   fill(128,128,128);
  ellipse(950,590,30,30);//color gris
   fill(255,87,51);
  ellipse(1000,590,30,30);//color naranja
   fill(255,160,122);
  ellipse(1050,590,30,30);//color rosado
  fill(0,0,0);
}
int value0,value1,value2,color,borrador;
int pul=2,pulb=3,dib=4,d;
void setup() {
Serial.begin(9600);
pinMode(pul,INPUT_PULLUP);
pinMode(pulb,INPUT_PULLUP);
pinMode(dib,INPUT_PULLUP);
attachInterrupt(digitalPinToInterrupt(pul),pulsador,FALLING );
attachInterrupt(digitalPinToInterrupt(pulb),pulsador1,FALLING );
}
void pulsador(){
  color=1;
}
void pulsador1(){
 borrador=1;
}

void loop() {
//color=0;

analogReference(EXTERNAL);
//Lee los valores del acelerometro
value0= analogRead(A0);
value1= analogRead(A1);
//value2= analogRead(A2);
//Envia los valores del acelerometro separados por una ","
Serial.print(value0);
Serial.print(",");
Serial.print(value1);
Serial.print(",");
//Serial.print(value2);//aun no tomamos el valor z haciendo pruebas para el 2D
//Serial.print(",");
Envia el valor para cambiar de color
Serial.print(color);
color=0;
Serial.print(",");
Serial.print(borrador);
borrador=0;
d= digitalRead(dib);
//Manda el valor del pin para dibujar 
if(d==1){
  Serial.print(",");
  Serial.println(d);
}
else 
{
Serial.print(","); 
Serial.println(d);
}
delay(400);
}



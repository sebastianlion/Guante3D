volatile int value0, value1, value2, color, borrador, cubox;
int pul = 2, pulb = 3, dib = 4, d, cub = 20, c, roll, pitch,rx,ry;
const float alpha = 0.5;
double fXg = 0, fYg = 0, fZg = 0;
volatile int times = 0, FLAG;

void setup() {
  Serial.begin(9600);
  pinMode(pul, INPUT_PULLUP);
  pinMode(pulb, INPUT_PULLUP);
  pinMode(dib, INPUT_PULLUP);
  pinMode(cub, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(pul), pulsador, FALLING );
  attachInterrupt(digitalPinToInterrupt(pulb), pulsador1, FALLING );

  TIMSK2 = (1 << TOIE2);
  TCCR2B = (7 << CS20);
}
void pulsador() {
  color = 1;
}
void pulsador1() {
  borrador = 1;
}
//void cubo(){
//cubox=1;
//}

void loop() {
  //color=0;

  analogReference(EXTERNAL);
  //Lee los valores del acelerometro
  
  //Envia los valores del acelerometro separados por una ","
  if(FLAG == 1){
    Serial.print(value0);
    Serial.print(",");
    Serial.print(value1-280);
    Serial.print(",");
    /*Serial.print(rx);
    Serial.print(",");
    Serial.print(value1);
    Serial.print(",");*/
    Serial.print(color);
  color = 0;
  Serial.print(",");
  Serial.print(borrador);
  borrador = 0;

   c = digitalRead(cub);
  //Manda el valor del pin para el cubo
  if (c == 1) {
    Serial.print(",");
    Serial.print(c);
  }
  else
  {
    Serial.print(",");
    Serial.print(c);
  }
  d = digitalRead(dib);
  //Manda el valor del pin para dibujar
  if (d == 1) {
    Serial.print(",");
    Serial.print(d);
  }
  else
  {
    Serial.print(",");
    Serial.print(d);
  }
  Serial.print(",");
  Serial.print(pitch);
  Serial.print(",");
  Serial.println(roll);
    FLAG = 0;
  } 
  
  //3D
  fXg = value0 * alpha + (fXg * (1.0 - alpha));
  fYg = value1 * alpha + (fYg * (1.0 - alpha));
  fZg = value2 * alpha + (fZg * (1.0 - alpha));

  roll  = (atan2(-fYg, fZg + fXg) * 180.0) / M_PI;
  pitch = (atan2(fXg, sqrt(fYg * fYg + fZg * fZg)) * 180.0) / M_PI;
  
}

//Timer
ISR(TIMER2_OVF_vect) {
  //se leen los valores de X y Y del acelerometro
  value0 = analogRead(A0);
  value1 = analogRead(A1);
  value2 = analogRead(A2);
  FLAG = 1;    
}





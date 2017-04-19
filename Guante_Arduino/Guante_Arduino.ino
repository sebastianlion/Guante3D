
int value0,value1,value2,color;
void setup() {
Serial.begin(9600);
pinMode(7,INPUT);
}

void loop() {
analogReference(EXTERNAL);
color= digitalRead(7);
value0= analogRead(A0);
value1= analogRead(A1);
value2= analogRead(A2);
Serial.print(value0);
Serial.print(",");
Serial.print(value1);
Serial.print(",");
Serial.print(value2);
Serial.print(",");
Serial.println(color);
delay(500);
}

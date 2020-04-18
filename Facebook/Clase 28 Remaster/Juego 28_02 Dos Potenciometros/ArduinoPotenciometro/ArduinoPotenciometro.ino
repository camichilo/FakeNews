int sensorValue;
int sensorValue2;

int inputPin = A0;
int inputPin2 = A1;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  sensorValue = analogRead (inputPin);
  sensorValue2= analogRead (inputPin2);

  //Serial.println(sensorValue,DEC);
  //enviar = sensorValue;
  //Serial.write(sensorValue/4);

  Serial.print(sensorValue);
  Serial.print('T');
  Serial.print(sensorValue2);
  Serial.println();

  delay(100);
}

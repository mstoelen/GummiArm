#include "RunningAverage.h" /* http://playground.arduino.cc/Main/RunningAverage */
#include <Servo.h>

int sensor_pin = A0;
int size_running = 15;

int sensor_value = 0; 
int servo_value = 0;
float average = 0.0;

Servo my_servo;
RunningAverage running(size_running);

void setup() {
  my_servo.attach(13);
  Serial.begin(9600);
  running.fillValue(0.0, size_running);
}

void loop() {
  sensor_value = analogRead(sensor_pin); 
  Serial.print("Measured voltage: ");
  Serial.print(sensor_value);
  
  servo_value = map(sensor_value, 970, 990, 0, 179);
  running.addValue(servo_value);
  average = running.getAverage();
  
  if ((average >= 0) || (average <= 255)) {
    my_servo.write(average);
    Serial.print(", servo output (averaged): ");
    Serial.print(average);
    Serial.print(".");
  }
  else {
    Serial.print(" and outside range.");
  }
  Serial.println(); 
  
  delay(5);  
}

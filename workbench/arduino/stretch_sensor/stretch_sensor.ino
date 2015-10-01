#include "RunningAverage.h" /* http://playground.arduino.cc/Main/RunningAverage */
#include <Servo.h>

int sensor_pin = A0;
int size_running = 50;

int sensor_value = 0; 
int servo_value = 0;
float average = 0.0;
int counter = 0;

Servo my_servo;
RunningAverage running(size_running);

void setup() {
  my_servo.attach(13);
  Serial.begin(9600);
  running.fillValue(0.0, size_running);
}

void loop() {
  sensor_value = analogRead(sensor_pin); 
  
  servo_value = map(sensor_value, 970, 990, 0, 179);
  running.addValue(servo_value);
  average = running.getAverage();
  
  if ((average >= 0) && (average <= 255)) {
    my_servo.write(average);
    
    if(counter > 20) {
      Serial.print("Input: ");
      Serial.print(sensor_value);
      Serial.print(", servo output (averaged): ");
      Serial.print(average);
      Serial.print(".");
      Serial.println();
      counter = 0;
    }
  }
  else {
    Serial.println("Outside range.");
  } 
  
  counter++;
  delay(5);  
}

/*
The following code was created for the Capstone Project of Brian Owens, Cole Wakley, Brad McDonald, Yu-Ching Lee, and Bill Ezouaouy
The purpose of this system is to relay information collected from sensors to the raspberry pi that will then display the information on a 7" display connected to the raspberry pi
*/

//Capacitive Soil Sensor
const int dry = 550; // value for dry sensor
const int wet = 200; // value for wet sensor

/*
Liquid flow rate sensor -DIYhacking.com Arvind Sanjeev

Measure the liquid/water flow rate using this code. 
Connect Vcc and Gnd of sensor to arduino, and the 
signal line to arduino digital pin 2.
 */

byte statusLed    = 13;
byte sensorInterrupt = 0;  // 0 = digital pin 2
byte sensorPin       = 0;
// The hall-effect flow sensor outputs approximately 4.5 pulses per second per
// litre/minute of flow.
// float calibrationFactor = 89; //Four LED
// float calibrationFactor = 82; //One LED
// float calibrationFactor = 86; //Two LED
float calibrationFactor = 86; //Three LED
volatile byte pulseCount;  
float flowRate;
unsigned int flowMilliLitres;
unsigned long totalMilliLitres;
unsigned long oldTime;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  pinMode(sensorPin, INPUT);
  digitalWrite(sensorPin, HIGH);
  pulseCount        = 0;
  flowRate          = 0.0;
  flowMilliLitres   = 0;
  totalMilliLitres  = 0;
  oldTime           = 0;

  // The Hall-effect sensor is connected to pin 2 which uses interrupt 0.
  // Configured to trigger on a FALLING state change (transition from HIGH
  // state to LOW state)
  attachInterrupt(sensorInterrupt, pulseCounter, FALLING);
}

void loop() {
    double humidityVal = analogRead(A0); //This is flipped with water level on display 2
    double waterlevelVal = analogRead(A1);
    double percentageHumidity = map(humidityVal, wet, dry, 100, 0); 
    if (percentageHumidity < 0)
      percentageHumidity =0;
    Serial.print("H: ");
    Serial.println(percentageHumidity);
    Serial.print("WL: ");
    Serial.println(waterlevelVal/5.4);
    Serial.print("FR: ");
    Serial.println(flowRate);
  
  delay(700);

  if((millis() - oldTime) > 400)    // Only process counters once per second
  { 
    // Disable the interrupt while calculating flow rate and sending the value to
    // the host
    detachInterrupt(sensorInterrupt);
    // Because this loop may not complete in exactly 1 second intervals we calculate
    // the number of milliseconds that have passed since the last execution and use
    // that to scale the output. We also apply the calibrationFactor to scale the output
    // based on the number of pulses per second per units of measure (litres/minute in
    // this case) coming from the sensor.
    flowRate = ((1000.0 / (millis() - oldTime)) * pulseCount) / calibrationFactor;
    // Note the time this processing pass was executed. Note that because we've
    // disabled interrupts the millis() function won't actually be incrementing right
    // at this point, but it will still return the value it was set to just before
    // interrupts went away.
    oldTime = millis();
    // Divide the flow rate in litres/minute by 60 to determine how many litres have
    // passed through the sensor in this 1 second interval, then multiply by 1000 to
    // convert to millilitres.
    flowMilliLitres = (flowRate / 60) * 1000;
    // Add the millilitres passed in this second to the cumulative total
    totalMilliLitres += flowMilliLitres;
    unsigned int frac;
    // Print the flow rate for this second in litres / minute
    // Serial.print("Flow rate: ");
    // Serial.print(double(flowRate));  // Print the integer part of the variable
    // Serial.println("L/min");
    // Reset the pulse counter so we can start incrementing again
    pulseCount = 0;
    // Enable the interrupt again now that we've finished sending output
    attachInterrupt(sensorInterrupt, pulseCounter, FALLING);
  }
}

/*
Insterrupt Service Routine
 */
void pulseCounter()
{
  // Increment the pulse counter
  pulseCount++;
}
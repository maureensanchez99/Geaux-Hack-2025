/*
  Author: Caleb W. Taylor
  Platform: Pro Micro - ATmega32U4
  Challenge 1 - Mockingbird

  --------------------------------------

  For this challenge, the user must "mimic a bird call." 
  In reality, the purpose of this program is entirely for humor.

  This system is equipped with a sound sensor and 2 status LEDs. If the user 
  makes a loud enough sound into the microphone, a green LED will light and the 
  LCD screen will display the completion code for the challenge. 
*/


#include <LiquidCrystal_I2C.h> // LCD library.
LiquidCrystal_I2C lcd(0x3F,16,2);  // LCD object (address is 0x3F for a 16 chars and 2 line display).


// Sensor & status LED pin definitions:
#define soundSensor 16
#define greenLED 9
#define redLED 8

// Game completetion status:
bool challengeComplete = false;

void setup() 
{
  // LCD setup:
  lcd.init();
  lcd.clear();         
  lcd.backlight();      // Make sure backlight is on

  // Initial LCD prompt:
  lcd.setCursor (1,0); // Order: (char, line)
  lcd.print("Complete Task");
  lcd.setCursor (0,1);
  lcd.print("To Get the Code!");

  // Sensor & LED pin setup:
  pinMode(soundSensor, INPUT); 
  pinMode(greenLED, OUTPUT);
  pinMode(redLED, OUTPUT);

  // Initial LED states:
  digitalWrite(greenLED, LOW);
  digitalWrite(redLED, HIGH);
  delay(500);
}

void loop() 
{
  // Read sensor as binary value (control sensitivity with potentiometer):
  bool birdMimic = digitalRead(soundSensor); 

  // If value reads 1, complete challenge:
  if (birdMimic && !challengeComplete)
  {
    lcd.clear();
    challengeComplete = true;
  }

  // Set staus lights and display code:
  if (challengeComplete)
  {
    digitalWrite(greenLED, HIGH);
    digitalWrite(redLED, LOW);

    // Display success message & progression code:    
    lcd.setCursor (1,0);
    lcd.print("Embarassing...");
    lcd.setCursor (2,1);
    lcd.print("Code: 6568");
  }
}
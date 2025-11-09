/*
  Author: Caleb W. Taylor
  Platform: Pro Micro - ATmega32U4
  Challenge 2 - Tree Hug

  --------------------------------------

  For this challenge, the user can operate independently or cooperate with
  a group of people. 
  
  Two metal contact points will be placed onto random trees 
  around campus in such a way that both cannot be touched at the same time without
  either literally hugging the tree, stretching both arms around it, or by 
  joining hands with another person or persons in such a way wheree one person
  is in contact with one, and the other with another member. 

  The goal of this, similar to the last challenge and the general theme of 
  the challenges/games in this project, is to be fun and humorous, while 
  encouraging social interaction and gerring out in nature.

  This is accomplished by utilizing a voltage divider circuit, with the 
  person or persons acting as resistors that complete the circuit. 
*/


#include <LiquidCrystal_I2C.h> // LCD library.
LiquidCrystal_I2C lcd(0x3F,16,2);  // LCD object (address is 0x3F for a 16 chars and 2 line display).

// Voltage reader pin definition:
#define voltRead A0

// Status variables:
bool completedCircuit = false;
int contactFlags = 0;
int contactDelay = 3000; // Needs to read voltage drop for atleast 3000 loops to be valid.

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

  // Voltage reader pin setup:
  pinMode(voltRead, INPUT);
}

void loop() 
{
  int val = analogRead(voltRead); // Live voltage value.

  // If voltage drop detected, flag it. 
  // This is necessary to filter noise and ensure an actual connection was made.
  if (val != 0)
    contactFlags++;
  else
    contactFlags -= 2; // Decrease faster than increase (avoid false positives).

  // Don't let flags become negative, or too large.
  if (contactFlags < 0)
    contactFlags = 0;
  else if (contactFlags > contactDelay)
    contactFlags = contactDelay;

  // Circuit is completed:
  if ((contactFlags >= contactDelay) && !completedCircuit)
  {
    lcd.clear();
    completedCircuit = true;
  }

  // Only need 1 valid contact moment to display code:
  if (completedCircuit)
  {
    // Display success message & progression code:    
    lcd.setCursor (1,0);
    lcd.print("Magic? Maybe...");
    lcd.setCursor (2,1);
    lcd.print("Code: 4376");
  }
}
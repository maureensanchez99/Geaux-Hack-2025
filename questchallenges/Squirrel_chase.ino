#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x3F, 16, 2);

void finish(){
  lcd.clear();
  lcd.backlight();

  lcd.setCursor (1,0);
  lcd.print("Squirrels Are");

  lcd.setCursor (1,1);
  lcd.print("Fast! 3806");
  while(1) {continue;}
}

void setup() {
  // put your setup code here, to run once:
  lcd.init();
  lcd.clear();
  lcd.backlight();

  lcd.setCursor (2,0);
  lcd.print("Chase Me To");

  lcd.setCursor (1,1);
  lcd.print("Get Your Code!");

  pinMode(6, INPUT_PULLUP);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(!digitalRead(6)){
    long startTime = millis();
    delay(100);
    if(!digitalRead(6)) {finish();}
  }
}

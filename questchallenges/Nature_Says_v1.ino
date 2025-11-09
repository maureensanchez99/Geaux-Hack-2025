const int button_pins[] = {2, 3, 4, 7};
const int LED_pins[] = {5, 6, 9, 10};
const int size = 4;
const int seq_size = 5;
int sequence[seq_size];
int status = 0;

void rndGenerate(int* sq){
  randomSeed(analogRead(A0));
  int min = 1;
  int max = size + 1;
  for(int i = 0; i < seq_size; i++){
    sq[i] = random(min, max);
  }
}

void LEDseq(int st){
  for(int i = 0; i < st; i++){
    analogWrite(LED_pins[sequence[i] - 1], 127);
    delay(1000);
    analogWrite(LED_pins[sequence[i] - 1], 0);
    delay(500);
  }
}

void Button_LED_Choose(int st, int* sq){
  bool button_unpressed = true;
  int progress = 0;
  int pressed_index = 0;

  while(progress < st){
    while (button_unpressed){
      for(int i = 0; i < size; i++){
        if(!digitalRead(button_pins[i])) {
          button_unpressed = false;
          pressed_index = i + 1;
          i = size;
        }
      }
    }
    delay(100);
    analogWrite(LED_pins[pressed_index - 1], 127);
    while (!button_unpressed){
      if(digitalRead(button_pins[pressed_index - 1])) {button_unpressed = true;}
    }
    delay(100);
    analogWrite(LED_pins[pressed_index - 1], 0);
    Serial.println(pressed_index);
    if(pressed_index == sq[progress]) {progress++;}
    else {failSequence(); break;}
  }
  delay(200);
  progress = 0;
}

void failSequence (){
  status = 0;
  rndGenerate(sequence);
  delay(1000);

  for(int i = 0; i < 3; i++){
    for(int j = 0; j <= 3; j++){
      analogWrite(LED_pins[j], 127);
    }
    delay(500);
    for(int j = 0; j <= 3; j++){
      analogWrite(LED_pins[j], 0);
    }
    delay(500);
  }
}

void finish(){
  for(int j = 0; j <= 5; j++){
    for(int i = 0; i <= 3; i++){
      analogWrite(LED_pins[i], 127);
      delay(250);
      analogWrite(LED_pins[i], 0);
    }
  }
  bool h = true; 
  while(1){h = true;}
}

void setup() {
  pinMode(button_pins[0], INPUT_PULLUP);
  pinMode(button_pins[1], INPUT_PULLUP);
  pinMode(button_pins[2], INPUT_PULLUP);
  pinMode(button_pins[3], INPUT_PULLUP);

  Serial.begin(9600);

  rndGenerate(sequence);

  delay(3000);
}

void loop() {
  for(int i = 0; i < seq_size; i++) {Serial.print(sequence[i]);}
  Serial.println(" ");
  status++;
  LEDseq(status);
  Button_LED_Choose(status, sequence);
  delay(1000);
  if(status >= seq_size) {finish();}
}

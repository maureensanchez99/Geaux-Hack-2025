# naturequest  
A mobile application that allows students to explore the campus and the nature within the grounds. 

## Team Members:  
- Maureen Sanchez (Design Lead)  
- Caleb Taylor (Hardware Focus)  
- Marc Hebert (Hardware Focus)
- Jp Gonzalez (Integration Lead)

## Prompt and Track Entering  
- Prompt: Create a product to help people touch grass/reconnect with nature  
- Track: Advanced Track

## Getting Started  

This project is a starting point for a Flutter application.  

A few resources to get you started if this is your first Flutter project:  

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)  
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)  

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.  

## Hardware Implementation

Users embark on a nature-themed quest that takes them through 4 (vaguely named) games:
  - Mockingbird
  - Tree Hugs
  - Nature Says
  - LSU Squirrel Chase

Each game will provide a fun and interesting challenge that involves the user interacting with 
the natural environment around them. While the app will guide the user through the experience, 
we will be utilizing extensive hardware implementation to actually present goals for the user. 

Each challenge will be built on the Pro Micro - ATmega32U4 board, and programmed using the Arduino IDE. 
They will utilize various sensors and methods in creative ways that are (hopefully) equally entertaining
and challenging. Some will be games, others will be simple tasks that the user must complete before a 
completion code is displayed on an LCD screen, and the app leads them to the next goal.

All code used for the hardware implementation will be located in the "questchallenges" directory, with explanations of 
the game/challenge in each file, respectively. 

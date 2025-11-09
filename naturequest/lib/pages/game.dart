import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/../main.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NatureQuestApp.softSunYellow,
      body: Center(
        child: SingleChildScrollView(  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logo_design.svg',
                height: 400,
                width: 400,
              ),
              Text(
                'Challenge Location:',
                style: TextStyle(
                  fontFamily: 'Merienda',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: NatureQuestApp.natureGreen,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                'Challenge:',
                style: TextStyle(
                  fontFamily: 'Merienda',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: NatureQuestApp.natureGreen,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter challenge code',
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // check if code is correct
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                ),
                child: const Text(
                  'Submit Code',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
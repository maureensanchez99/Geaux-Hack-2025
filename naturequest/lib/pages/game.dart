import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/../main.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( 
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/logo_design.svg',
          height: 400,
          width: 400,
        ),
        const SizedBox(height: 80),
        Text(
          'Challenge Location:', 
          // Pull challenge location from database
          style: TextStyle(
            fontFamily: 'Merienda',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: NatureQuestApp.natureGreen,
          )
        ),
        const SizedBox(height: 40),
        Text(
          'Challenge:', 
          // Pull challenge description from database
          style: TextStyle(
            fontFamily: 'Merienda',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: NatureQuestApp.natureGreen,
          )
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
    );
  }
}
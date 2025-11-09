import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/../main.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NatureQuestApp.softSunYellow,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Reduced logo size for better proportion
                SvgPicture.asset(
                  'assets/logo_design.svg',
                  height: 350,
                  width: 350,
                ),

                Column(
                  children: [
                    Text(
                      'Challenge Location:',
                      style: TextStyle(
                        fontFamily: 'Merienda',
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: NatureQuestApp.earthyBrown,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Challenge:',
                      style: TextStyle(
                        fontFamily: 'Merienda',
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: NatureQuestApp.earthyBrown,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 280,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter challenge code',
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // check if code is correct
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: NatureQuestApp.natureGreen,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      child: const Text(
                        'Submit Code',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

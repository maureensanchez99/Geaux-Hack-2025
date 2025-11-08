import 'package:flutter/material.dart';
import 'landing.dart';
import '/../main.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NatureQuestApp.softSunYellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to NatureQuest',
              style: TextStyle(
                fontFamily: 'Merienda',
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: NatureQuestApp.natureGreen,
                shadows: [
                  Shadow(
                    offset: const Offset(10.0, 5.0),
                    blurRadius: 5.0,
                    color: NatureQuestApp.earthyBrown.withOpacity(0.6),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 200),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LandingPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: NatureQuestApp.softLavender,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text(
                  'Start Exploring',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

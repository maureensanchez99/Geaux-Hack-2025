import 'package:flutter/material.dart';
import 'landing.dart';
import '/../main.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NatureQuestApp.softMintGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Nature Quest',
              style: TextStyle(
                fontFamily: 'Merienda',
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: NatureQuestApp.lsuGold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: NatureQuestApp.lsuPurple,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text(
                'Start Exploring',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

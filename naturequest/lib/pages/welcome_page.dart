import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'landing.dart';
import '../main.dart';

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
            const SizedBox(height: 80),  
            SvgPicture.asset(
              'assets/logo_design.svg',
              height: 350,
              width: 350,
            ),
        
            const Spacer(), 
        
            Padding(
              padding: const EdgeInsets.only(bottom: 150.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LandingPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: NatureQuestApp.softLavender,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 6,
                ),
                child: const Text(
                  'Start Exploring',
                  style: TextStyle(
                    fontSize: 22,
                    color: NatureQuestApp.softSunYellow,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

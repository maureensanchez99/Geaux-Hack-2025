import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/../main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NatureQuestApp.softSunYellow,
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo_design.svg',
              height: 500,
              width: 500,
            ),
            //const SizedBox(height: 80),
            Text(
              'Login Page',
              style: TextStyle(
                  fontFamily: 'Merienda',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: NatureQuestApp.natureGreen,
                  shadows: [
                    Shadow(
                      offset: const Offset(10.0, 5.0),
                      blurRadius: 25.0,
                      color: NatureQuestApp.earthyBrown.withOpacity(0.6),
                    ),
                  ]
                ),
                textAlign: TextAlign.center,
            ),
          ],
        ),
    ),
    );
  }
}

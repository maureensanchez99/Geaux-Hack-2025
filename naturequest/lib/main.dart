import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const NatureQuestApp());
}

class NatureQuestApp extends StatelessWidget {
  const NatureQuestApp({super.key});

  // Color constants
  static const Color natureGreen = Color(0xFF4CAF50);
  static const Color earthyBrown = Color(0xFF6D4C41);
  static const Color softMintGreen = Color(0xFF98E2A1);
  static const Color softSunYellow = Color(0xFFFFF9C4);
  static const Color skyBlue = Color(0xFF81D4FA);
  static const Color softLavender = Color(0xFFE1BEE7);
  static const Color lightPeach = Color(0xFFFFCCBC);
  static const Color offWhite = Color(0xFFF5F5F5);

  // Global ThemeData
  ThemeData get appTheme => ThemeData(
        fontFamily: 'Poppins',
        primaryColor: softLavender,
        scaffoldBackgroundColor: softSunYellow,  
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Merienda',
            fontWeight: FontWeight.w700,
            color: earthyBrown,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Merienda',
            fontWeight: FontWeight.w600,
            color: softLavender,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: softSunYellow,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: softLavender,
            foregroundColor: softSunYellow,
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NatureQuest',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),  
    );
  }
}

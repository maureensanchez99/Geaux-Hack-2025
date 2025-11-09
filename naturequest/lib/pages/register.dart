import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'mainNavigation.dart';
import '../main.dart'; // fixed relative import

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NatureQuestApp.softSunYellow,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logo_design.svg',
                height: 350,
                width: 350,
              ),
              const SizedBox(height: 40),

              // Username field
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                ),
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: 300,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Login button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainNavigation()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: NatureQuestApp.softLavender,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 22,
                    color: NatureQuestApp.softSunYellow,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

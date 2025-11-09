import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logo_design.svg',
            height: 500,
            width: 500,
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

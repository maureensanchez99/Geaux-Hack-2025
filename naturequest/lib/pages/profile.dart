import 'package:flutter/material.dart';
import '/../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // Center only the "Profile" title
          Center(
            child: Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Merienda',
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: NatureQuestApp.natureGreen,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 80),
          Text(
            'Username:',
            // Pull username from database
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: NatureQuestApp.earthyBrown,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Connected Friends:',
            // Pull friends list from database
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: NatureQuestApp.earthyBrown,
            ),
          ),
        ],
      ),
    );
  }
}

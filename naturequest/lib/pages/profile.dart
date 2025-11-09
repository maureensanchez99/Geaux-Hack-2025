import 'package:flutter/material.dart';
import '/../main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> friends = ['Alex', 'Jamie', 'Taylor'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
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
          const SizedBox(height: 60),

          Text(
            'Username:',
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: NatureQuestApp.earthyBrown,
            ),
          ),
          const SizedBox(height: 100),

          Text(
            'Connected Friends:',
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: NatureQuestApp.earthyBrown,
            ),
          ),
          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: friends.map((friend) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: NatureQuestApp.softLavender,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    friend,
                    style: TextStyle(
                      fontFamily: 'Merienda',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: NatureQuestApp.natureGreen,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

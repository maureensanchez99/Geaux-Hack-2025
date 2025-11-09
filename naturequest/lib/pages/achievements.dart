import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/../main.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Text(
            'Achievements', 
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: NatureQuestApp.natureGreen,
            )
          ),
          const SizedBox(height: 80),
          Text(
            'Challenges Completed:', 
            // Pull challenge location from database
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: NatureQuestApp.natureGreen,
            )
          ),
          const SizedBox(height: 40),
          Text(
            'Badges Collected:', 
            // Pull challenge description from database
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: NatureQuestApp.natureGreen,
            )
          ),
        ],
      ),
    );
  }
}
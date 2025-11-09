import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  final List<bool> badgeStatus = const [false, false, false];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> badgeFiles = [
      {
        'locked': 'assets/welcome_badge_grey.svg',
        'unlocked': 'assets/welcome_badge.svg',
      },
      {
        'locked': 'assets/5_badges_grey.svg',
        'unlocked': 'assets/5_badges.svg',
      },
      {
        'locked': 'assets/challenge_path_badge_grey.svg',
        'unlocked': 'assets/challenge_path_badge.svg',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Center(
            child: Text(
              'Achievements',
              style: TextStyle(
                fontFamily: 'Merienda',
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: NatureQuestApp.natureGreen,
                shadows: [
                  Shadow(
                    color: NatureQuestApp.earthyBrown.withOpacity(0.4),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 60),

          Text(
            'Challenges Completed:',
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: NatureQuestApp.earthyBrown,
            ),
          ),

          const SizedBox(height: 40),

          Text(
            'Badges:',
            style: TextStyle(
              fontFamily: 'Merienda',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: NatureQuestApp.earthyBrown,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(badgeFiles.length, (index) {
              final bool isUnlocked = badgeStatus[index];
              final String svgFile = isUnlocked
                  ? badgeFiles[index]['unlocked']!
                  : badgeFiles[index]['locked']!;
              return SvgPicture.asset(
                svgFile,
                height: 100,
                width: 100,
              );
            }),
          ),
        ],
      ),
    );
  }
}
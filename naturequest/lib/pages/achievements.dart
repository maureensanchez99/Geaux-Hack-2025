import 'package:flutter/material.dart';
import '/../main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';

const baseURL = 'http://100.111.150.67:8000';

class AchievementPage extends StatefulWidget {
  final String username;
  const AchievementPage({super.key, required this.username});

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage>
{
  bool _isLoading = false;
  String? _errorMsg;
  Map<String, dynamic>? _user;
  int _achievementCount = 0;
  
  Future<void> _fetchUser() async
  {
    setState(()
    {
      _isLoading = true; 
      _errorMsg = null;
    });

    try
    {
      final uri = Uri.parse('$baseURL/user/${Uri.encodeComponent(widget.username)}');
      final res = await http.get(uri);

      if(res.statusCode == 200)
      {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        setState(() 
        {
          _user = data;
          _achievementCount = data['achievements'] ?? 0;
        });
      }
      else if (res.statusCode == 404)
      {
        setState(() => _errorMsg = 'User not found');
      }
      else 
      {
        setState(() => 'Server Error: ${res.statusCode}');
      }
    }
    catch (e)
    {
      setState(() => _errorMsg = "Connection Error: $e");
    }
    finally
    {
      if(mounted) setState(() => _isLoading = false);
    }
  }

@override
void initState() 
{
  super.initState();
  _fetchUser();
}





  @override
  Widget build(BuildContext context) {

    final List<bool> badgeStatus = [
      _achievementCount >= 1, // 1st badge unlocked
      _achievementCount >= 2, // 2nd badge unlocked
      _achievementCount >= 3, // 3rd badge unlocked
    ];
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
          const SizedBox(height: 20),
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
import 'package:flutter/material.dart';
import '/../main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseURL = 'http://100.111.150.67:8000';
class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
{
  bool _isLoading = false;
  String? _errorMsg;
  Map<String, dynamic>? _user;


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
        setState(() => _user = data);
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
    final username = widget.username;
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
          username, // pulled from widget.username
          style: const TextStyle(
            fontFamily: 'Merienda',
            fontSize: 28,
            color: Colors.black87,
          ),
          ),
          const SizedBox(height: 40),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/../main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseURL = 'http://100.111.150.67:8000';

class GamePage extends StatefulWidget {
  final String username;
  const GamePage({super.key, required this.username});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
{
  bool _isLoading = false;
  String? _errorMsg;
  Map<String, dynamic>? _user;
  List<Map<String,dynamic>> _quests = [];
  int _achievementCount = 0;
  int _currentQuestIndex = 0;

  final TextEditingController _codeController = TextEditingController();
  
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

  Future<void> _fetchQuests() async
  {
    try 
    {
      final uri = Uri.parse('$baseURL/quests');
      final res = await http.get(uri);
      if (res.statusCode == 200) 
      {
        final data = jsonDecode(res.body) as List<dynamic>;
        setState(() => _quests = List<Map<String, dynamic>>.from(data));
      } 
      else 
      {
        setState(() => _errorMsg = 'Failed to load quests');
      }
    } 
    catch (e) 
    {
      setState(() => _errorMsg = 'Connection error: $e');
    }
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMsg = null;
    });

    await Future.wait([_fetchUser(), _fetchQuests()]);

    setState(() => _isLoading = false);
  }

@override
void initState() 
{
  super.initState();
  _loadData();

}

Future<void> _submitCode() async {
    if (_quests.isEmpty) return;

    final inputCode = int.tryParse(_codeController.text.trim());
    if (inputCode == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number')),
      );
      return;
    }

    final currentQuest = _quests[_currentQuestIndex];

    if (inputCode == currentQuest['code']) {
      // ✅ Correct code
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Correct! You completed: ${currentQuest['note']}')),
      );

      // Update achievement count on backend
      final newAchievementCount = _achievementCount + 1;
      try {
        await http.post(
          Uri.parse('$baseURL/users/${widget.username}/update_stats'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'achievements': newAchievementCount}),
        );
      } catch (_) {}

      setState(() {
        _achievementCount = newAchievementCount;
        _codeController.clear();

        // ✅ Move to next quest
        if (_currentQuestIndex < _quests.length - 1) {
          _currentQuestIndex++;
        } else {
          // All quests completed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('🎉 All quests completed!')),
          );
        }
      });
    } else {
      // ❌ Incorrect code
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('❌ Wrong code, try again!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuest =
        _quests.isNotEmpty ? _quests[_currentQuestIndex] : null;

    return Scaffold(
      backgroundColor: NatureQuestApp.softSunYellow,
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      SvgPicture.asset('assets/logo_design.svg', height: 200),
                      const SizedBox(height: 10),
              
                      Text(
                        'Welcome, ${widget.username}',
                        style: TextStyle(
                          fontFamily: 'Merienda',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: NatureQuestApp.natureGreen,
                        ),
                      ),
                      const SizedBox(height: 20),
              
                      // 🧭 Quest info
                      if (currentQuest != null)
                        Column(
                          children: [
                            Text(
                              'Challenge Location:',
                              style: TextStyle(
                                fontFamily: 'Merienda',
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: NatureQuestApp.earthyBrown,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              'Find us by the lakes behind Herget Hall',
                              style: TextStyle(
                                fontFamily: 'Merienda',
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Challenge:',
                              style: TextStyle(
                                fontFamily: 'Merienda',
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: NatureQuestApp.earthyBrown,
                              ),
                            ),
                            Text(
                              currentQuest['note'] ?? 'No challenge available',
                              style: const TextStyle(
                                fontFamily: 'Merienda',
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 25),
                          ],
                        )
                      else
                        const Text(
                          'No quests available.',
                          style: TextStyle(fontSize: 18),
                        ),
              
                      SizedBox(
                        width: 240,
                        child: TextFormField(
                          controller: _codeController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter challenge code',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(height: 20),
              
                      ElevatedButton(
                        onPressed: _submitCode,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: NatureQuestApp.natureGreen,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                        ),
                        child: const Text(
                          'Submit Code',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              
                      const SizedBox(height: 20),
              
                      // Progress info
                      Text(
                        'Quest ${_currentQuestIndex + 1} of ${_quests.length}',
                        style: const TextStyle(
                          fontFamily: 'Merienda',
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
            ),
      ),
    );
  }
}
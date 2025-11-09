import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'mainNavigation.dart';
import '../main.dart'; // fixed relative import
import 'package:http/http.dart' as http;
import 'dart:convert';


const baseURL = 'http://100.111.150.67:8000';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState(); 
}
class _LoginPageState extends State<LoginPage>
{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMsg;

  Future<void> _login() async {
    setState(()
    {
      _isLoading = true;
      _errorMsg = null;
    }
    );
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    try
    {
      final res = await http.post
      (
        Uri.parse('$baseURL/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password})
      );
    
    if (res.statusCode == 200)
    {
      if (!mounted) return;
      Navigator.pushReplacement( context, MaterialPageRoute(builder: (_) => MainNavigation(username: username)));
    }
    else
    {
      setState(() => _errorMsg = 'Invalid username or password');
    }
    }
    catch (e)
    {
      setState(() => _errorMsg = 'Connection error: $e');
    }
    finally
    {
      setState(() => _isLoading = false);
    }
    
  }



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
                  controller: _usernameController,
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
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                ),
              ),
              const SizedBox(height: 50),

              if (_errorMsg != null)
                Text(_errorMsg!, style: const TextStyle(color: Colors.red)),
              if (_isLoading) const CircularProgressIndicator(),


              // Login button
              ElevatedButton(
                onPressed: _isLoading ? null : _login,
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

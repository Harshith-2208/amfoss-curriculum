import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'user_pref.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
 @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 171, 171, 33), 
      body: SafeArea(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome!\nPokédex',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),

              // Username Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: usernameController,
                  onChanged: (_) => setState(() => _isTyping = true),
                decoration: InputDecoration(
                  hintText: 'Enter Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                 controller: passwordController,
                  obscureText: true,
                  onChanged: (_) => setState(() => _isTyping = true),
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Register and Login Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signin');
                    },
                    child: const Text(
                      'Login here',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                    final response = await http.post(
                    Uri.parse('http://10.113.20.88:5000/signup'),
                    headers: {'Content-Type': 'application/json'},
                    body: jsonEncode({'username': usernameController.text, 'password': passwordController.text}),
                  );

                  if (response.statusCode == 201) {
                    await saveUsername(usernameController.text);

                    final randomId = Random().nextInt(150) + 1;
                    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$randomId'));

                    if (response.statusCode == 200) {
                      final data = jsonDecode(response.body);
                      final user_name = await getUsername();
                      if (user_name != null) {
                        print(user_name);
                      await http.post(
                        Uri.parse('http://10.113.20.88:5000/capture'),  
                        headers: {'Content-Type': 'application/json'},
                        body: jsonEncode({
                          'name': data['name'],
                          'image_url': data['sprites']['other']['official-artwork']['front_default'],
                          'stats': 'HP: ${data['stats'][0]['base_stat']}', 
                          'abilities': 'static',
                          'username': user_name ,
                        }),
                      );
                      }
                    }
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Image.asset(
                'assets/images/pikachu.png', 
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    )
    );
  }
}

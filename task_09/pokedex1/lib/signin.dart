import 'package:flutter/material.dart';
import 'package:pokedex1/user_pref.dart';
import '/requesthandle.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
 @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signup');
                    },
                    child: const Text(
                      'Register here',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                    final result = await ApiService.login(usernameController.text, passwordController.text);
                    if (result == 'success') {
                      saveUsername(usernameController.text);
                      Navigator.pushReplacementNamed(context, '/home');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login successful!")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result)),
                      );
                    }
                  },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
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
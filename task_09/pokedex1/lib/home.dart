import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_pref.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List capturedPokemons = [];

  @override
  void initState() {
    super.initState();
    fetchCapturedPokemons();
  }

  Future<void> fetchCapturedPokemons() async {
    try {
      final username = await getUsername();
      if (username != null) {
      final response = await http.get(Uri.parse('http://10.113.20.88:5000/captured/$username'));
      
      if (response.statusCode == 200) {
        setState(() {
          capturedPokemons = json.decode(response.body);
        });
      } else {
        print('Failed to fetch Pokémon');
      }
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 171, 171, 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'All your Pokémon’s',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: capturedPokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = capturedPokemons[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      color: Colors.grey[300],
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Image.network(
                            pokemon['image_url'],
                            width: 70,
                            height: 70,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image_not_supported),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(pokemon['name'] ?? 'Unknown', style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text('Stats: ${pokemon['stats'] ?? 'N/A'}'),
                              Text('Abilities: ${pokemon['abilities'] ?? 'N/A'}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

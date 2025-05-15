import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user_pref.dart';

class CaptureNewPage extends StatefulWidget {
  const CaptureNewPage({super.key});

  @override
  State<CaptureNewPage> createState() => _CaptureNewPageState();
}

class _CaptureNewPageState extends State<CaptureNewPage> {
  String? pokemonName;
  String? imageUrl;
  final TextEditingController _controller = TextEditingController();
  bool isRevealed = false;
  String message = '';
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    fetchRandomPokemon();
  }

  Future<void> fetchRandomPokemon() async {
    final randomId = Random().nextInt(150) + 1; 
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$randomId'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        pokemonName = data['name'];
        print(pokemonName);
        imageUrl = data['sprites']['other']['official-artwork']['front_default'];
        isRevealed = false;
        message = '';
        _controller.clear();
      });
    } else {
      setState(() {
        message = 'Failed to load Pokémon';
      });
    }
  }

void checkAnswer() async {
  final guess = _controller.text.trim().toLowerCase();
  if (guess == pokemonName?.toLowerCase()) {
    setState(() {
      isRevealed = true;
      isCorrect = true;
      message = 'Correct! It\'s ${pokemonName![0].toUpperCase()}${pokemonName!.substring(1)}!';
    });


final user_name = await getUsername();
if (user_name != null) {
    final response = await http.post(
      Uri.parse('http://10.113.20.88:5000/capture'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': pokemonName,
        'image_url': imageUrl,
        'stats': 'Speed: 90',      
        'abilities': 'static', 
        'username': user_name ,
      }),
    );

    if (response.statusCode == 200) {
      print('Captured Pokémon saved successfully!');
    } else {
      print('Failed to save Pokémon.');
    }
  }
  } else {
    setState(() {
      isRevealed = true;
      isCorrect = false;
      message = 'Oops! It was ${pokemonName![0].toUpperCase()}${pokemonName!.substring(1)}.';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 171, 171, 33),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Capture New Pokémon',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              if (imageUrl != null)
                ColorFiltered(
                  colorFilter: isRevealed
                      ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply)
                      : const ColorFilter.mode(Colors.black, BlendMode.srcATop),
                  child: Image.network(imageUrl!, height: 250),
                )
              else
                const CircularProgressIndicator(),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Guess the Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                child: const Text('Submit', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: TextStyle(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isRevealed)
                TextButton(
                  onPressed: fetchRandomPokemon,
                  child: const Text('Play Again'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
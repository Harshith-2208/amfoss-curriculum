import 'package:flutter/material.dart';
import 'main.dart';
import 'apiservice.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      home: const HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  final List<Map<String, dynamic>> recommendedPokemons = const [
    {
      "name": "Pikachu",
      "stats": "Speed: 90, Attack: 55",
      "abilities": "Static, Lightning Rod",
      "image": Icons.flash_on,
    },
    {
      "name": "Charmander",
      "stats": "Speed: 65, Attack: 52",
      "abilities": "Blaze, Solar Power",
      "image": Icons.local_fire_department,
    },
    {
      "name": "Bulbasaur",
      "stats": "Speed: 45, Attack: 49",
      "abilities": "Overgrow, Chlorophyll",
      "image": Icons.eco,
    },
  ];
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final List<Map<String, dynamic>> recommendedPokemons = const [
    {
      "name": "Pikachu",
      "stats": "Speed: 90",
      "abilities": "Static",
      "image": Icons.flash_on,
    },
    {
      "name": "Charmander",
      "stats": "Speed: 65",
      "abilities": "Blaze",
      "image": Icons.local_fire_department,
    },
    {
      "name": "Bulbasaur",
      "stats": "Speed: 45",
      "abilities": "Overgrow,",
      "image": Icons.eco,
    },
  ];
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic>? _pokemonData;

  void _searchPokemon() async {
    final result = await PokeApiService.fetchPokemon(_searchController.text);
    setState(() {
      _pokemonData = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 171, 171, 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: _searchController,
              onSubmitted: (_) => _searchPokemon(),
              decoration: InputDecoration(
                hintText: 'Search by name or ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            if (_pokemonData != null)
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Image.network(
                    _pokemonData!['sprites']['front_default'] ?? '',
                    width: 100,
                    height: 100,
                  ),
                  title: Text(_pokemonData!['name'].toString().toUpperCase()),
                  subtitle: Text(
                    'ID: ${_pokemonData!['id']}\nHeight: ${_pokemonData!['height']}\nWeight: ${_pokemonData!['weight']}',
                  ),
                ),
              ),
            const SizedBox(height: 20),
            const Text(
              "Recommended Pokémon's",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recommendedPokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = recommendedPokemons[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Icon(
                              pokemon['image'],
                              size: 40,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pokemon['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text('Stats: ${pokemon['stats']}'),
                              Text('Abilities: ${pokemon['abilities']}'),
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
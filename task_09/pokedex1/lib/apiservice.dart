import 'dart:convert';
import 'package:http/http.dart' as http;

class PokeApiService {
  static const String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  static Future<Map<String, dynamic>?> fetchPokemon(String query) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$query'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching Pokémon: $e');
      return null;
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.113.20.88:5000';

  static Future<String> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode==200){
      return 'success';
    }
    else {
      return jsonDecode(response.body)['message'];
    }
  }

  static Future<String> signup(String username, String password) async {
    final url = Uri.parse('$baseUrl/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 201) {
      return 'success';
    } else {
      return jsonDecode(response.body)['message'];
    }
  }
}

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUsername(String username) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
}

Future<String?> getUsername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}

Future<void> clearSharedPref() async{
final prefs = await SharedPreferences.getInstance();
await prefs.clear();
}


import 'package:flutter/material.dart';
import 'package:pokedex1/user_pref.dart';
import 'signin.dart'; 
import 'signup.dart';
import 'home.dart';
import 'capturenew.dart';
import 'friends.dart';
import 'search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/signin', 
      routes: {
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(), 
        '/home': (context) => const HomeScreen(),
        '/capturenew': (context) => const CaptureNewPage(),
      },
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const FriendsPage(),
    const CaptureNewPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: const Color.fromARGB(255, 12, 22, 12),
         title: Text('Welcome, User', style: TextStyle(
            color: Colors.white
          )),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
                      clearSharedPref(); 
                      Navigator.pushReplacementNamed(context, '/signin');
                    },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Friends'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Capture New'),
        ],
        selectedItemColor: const Color.fromARGB(255, 12, 22, 12),
        unselectedItemColor: const Color.fromARGB(255, 93, 92, 92),
      ),
    );
  }
}

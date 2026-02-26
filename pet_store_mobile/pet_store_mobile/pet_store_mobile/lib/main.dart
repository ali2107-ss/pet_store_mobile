import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B4CE6),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  bool _isLoggedIn = false;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showAuthSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) => AuthScreen(
          scrollController: scrollController,
          onSuccess: () {
            setState(() {
              _isLoggedIn = true;
            });
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoggedIn ? _screens[_selectedIndex] : const HomeScreen(),
      bottomNavigationBar: _isLoggedIn
          ? NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onNavItemTapped,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            )
          : null,
      floatingActionButton: Visibility(
        visible: !_isLoggedIn,
        child: FloatingActionButton.extended(
          onPressed: _showAuthSheet,
          icon: const Icon(Icons.login),
          label: const Text('Sign In'),
          backgroundColor: const Color(0xFF6B4CE6),
        ),
      ),
    );
  }
}

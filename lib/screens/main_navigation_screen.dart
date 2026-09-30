import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final String username;

  const MainNavigationScreen({super.key, required this.username});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(),
      ProfileScreen(username: widget.username),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAF8FD),
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pokemon App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withValues(alpha: 0.65),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

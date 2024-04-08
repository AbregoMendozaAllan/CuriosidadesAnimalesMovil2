import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'NuevaCuriosidad.dart'; // Import NuevaCuriosidadScreen here

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Default index of first screen
  late List<String> _appBarTitles; // List to store app bar titles

  @override
  void initState() {
    super.initState();
    // Initialize the app bar titles based on bottom navigation bar labels
    _appBarTitles = [
      'Home Screen',
      'Random',
      'Favorites',
      'Settings',
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getBodyWidget(int index) {
    switch (index) {
      case 0:
        return const MyHomePage(); // Load the HomeScreen widget for index 0
      case 1:
        return const NuevaCuriosidadScreen(); // Load NuevaCuriosidadScreen widget for index 1
      default:
        return Container(); // Placeholder for unknown index
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]), // Set the app bar title dynamically
        backgroundColor: Colors.blue, // Set the background color to blue
      ),
      body: _getBodyWidget(_selectedIndex), // Load body dynamically
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shuffle),
            label: 'Random',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black, // Setting unselected icon color to black
        onTap: _onItemTapped,
      ),
    );
  }
}

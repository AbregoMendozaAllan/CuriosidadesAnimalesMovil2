import 'package:flutter/material.dart';
import 'components/bottom_navigation_bar.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Default index of first screen

  // List of widgets to call on onTap.
  // Ideally, you might use a navigation mechanism like Navigator.pushNamed
  // to navigate to different screens.
  final List<Widget> _widgetOptions = [
    const Text('Home Page'),
    const Text('Random Page'),
    const Text('Favorites Page'),
    const Text('Settings Page'),
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
        title: const Text('BottomAppBar Demo'),
      ),
      body: Center(
        // Display the selected page
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// MainScreen.dart
import 'package:flutter/material.dart';
import '../data/main_routes.dart';

class MainScreen extends StatefulWidget {
  final String userId; // Add userId property

  const MainScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenLogic mainScreenLogic;

  @override
  void initState() {
    super.initState();
    mainScreenLogic = MainScreenLogic(userId: widget.userId); // Initialize MainScreenLogic with userId
  }

  void _onItemTapped(int index) {
    setState(() {
      mainScreenLogic.setSelectedIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mainScreenLogic.appBarTitle), // Use the title from mainScreenLogic
        backgroundColor: Colors.blue,
      ),
      body: mainScreenLogic.getBodyWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shuffle), label: 'Random'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: mainScreenLogic.selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

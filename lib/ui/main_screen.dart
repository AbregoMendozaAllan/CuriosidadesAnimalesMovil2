import 'package:flutter/material.dart';
import '../data/main_routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenLogic mainScreenLogic;
  late List<String> _appBarTitles;

  @override
  void initState() {
    super.initState();
    mainScreenLogic = MainScreenLogic();
    _appBarTitles = [
      'Home Screen',
      'Random',
      'Favorites',
      'Settings',
    ];
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
        title: Text(_appBarTitles[mainScreenLogic.selectedIndex]),
        backgroundColor: Colors.blue,
      ),
      body: mainScreenLogic.getBodyWidget(), // Directly using logic class method
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
<<<<<<< HEAD
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Nuevo'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configuración'),
=======
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Random'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
>>>>>>> 89628f286863735ce8f143a99cf9e26547d98344
        ],
        currentIndex: mainScreenLogic.selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

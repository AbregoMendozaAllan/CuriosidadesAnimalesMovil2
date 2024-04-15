import 'package:flutter/material.dart';
import '../data/main_routes.dart';

class MainScreen extends StatefulWidget {
  final String userId; 

  const MainScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenLogic mainScreenLogic;

  @override
  void initState() {
    super.initState();
    mainScreenLogic = MainScreenLogic(userId: widget.userId); 
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
        title: Text(mainScreenLogic.appBarTitle), 
        backgroundColor: Colors.blue,
      ),
      body: mainScreenLogic.getBodyWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Nueva Curiosidad'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configuración'),
        ],
        currentIndex: mainScreenLogic.selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

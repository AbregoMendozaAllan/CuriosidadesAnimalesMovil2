import 'package:flutter/cupertino.dart';

import '../ui/NuevaCuriosidad.dart';
import '../ui/configuracion_screen.dart';
import '../ui/favoritos_screen.dart';
import '../ui/homescreen.dart';

class MainScreenLogic {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
  }

  Widget getBodyWidget() {
    switch (_selectedIndex) {
      case 0:
        return const MyHomePage();
      case 1:
        return const NuevaCuriosidadScreen();
      case 2:
        return const FavoritosScreen();
      case 3:
        return const ConfiguracionScreen();
      default:
        return Container(); // A fallback, though this should ideally never be reached.
    }
  }

// Add more logic functions here as needed
}

import 'package:flutter/material.dart';
import '../ui/NuevaCuriosidad.dart';
import '../ui/configuracion_screen.dart';
import '../ui/favoritos_screen.dart';
import '../ui/homescreen.dart';

class MainScreenLogic {
  late int _selectedIndex;
  late String _appBarTitle;
  final String userId;

  MainScreenLogic({required this.userId}) {
    _selectedIndex = 0;
    _appBarTitle = 'Home Screen';
  }

  int get selectedIndex => _selectedIndex;
  String get appBarTitle => _appBarTitle;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        _appBarTitle = 'Home Screen';
        break;
      case 1:
        _appBarTitle = 'Random';
        break;
      case 2:
        _appBarTitle = 'Favorites';
        break;
      case 3:
        _appBarTitle = 'Settings';
        break;
      default:
        _appBarTitle = 'Unknown';
    }
  }

  Widget getBodyWidget() {
    switch (_selectedIndex) {
      case 0:
        return MyHomePage();
      case 1:
        return NuevaCuriosidadScreen(userId: userId);
      case 2:
        return FavoritosScreen(userId: userId);
      case 3:
        return ConfiguracionScreen(userId: userId);
      default:
        return Container();
    }
  }
}

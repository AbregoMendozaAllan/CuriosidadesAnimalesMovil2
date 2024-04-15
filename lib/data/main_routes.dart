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
    _appBarTitle = 'Inicio';
  }

  int get selectedIndex => _selectedIndex;
  String get appBarTitle => _appBarTitle;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        _appBarTitle = 'Inicio';
        break;
      case 1:
        _appBarTitle = 'Nueva Curiosidad';
        break;
      case 2:
        _appBarTitle = 'Favoritos';
        break;
      case 3:
        _appBarTitle = 'Configuración';
        break;
      default:
        _appBarTitle = 'Unknown';
    }
  }

  Widget getBodyWidget() {
    switch (_selectedIndex) {
      case 0:
        return MyHomePage(userId: userId);
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

import 'package:curiosidadesanimalesmovil2/ui/homescreen.dart';
import 'package:flutter/material.dart';
import 'ui/nuevaCuriosidad.dart';

void main() {
  runApp(const MyApp());
}

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BottomAppBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(), // Set MyHomePage as the initial route
    );
  } 
} */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curiosidades de Animales',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NuevaCuriosidadScreen(), // Utiliza NuevaCuriosidadScreen como la pantalla inicial
    );
  }
}

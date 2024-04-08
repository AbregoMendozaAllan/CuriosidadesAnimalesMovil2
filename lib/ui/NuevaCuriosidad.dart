import 'package:flutter/material.dart';
import 'components/bottom_navigation_bar.dart';
import 'components/curiosity_card.dart'; // Importa el archivo curiosity_card.dart

class NuevaCuriosidadScreen extends StatefulWidget {
  const NuevaCuriosidadScreen({Key? key}) : super(key: key);

  @override
  _NuevaCuriosidadScreenState createState() =>
      _NuevaCuriosidadScreenState();
}

class _NuevaCuriosidadScreenState extends State<NuevaCuriosidadScreen> {
  int _selectedIndex = 0; // Default index of first screen
  String? _selectedAnimal; // Added to track selected animal
  bool _showCuriosityCard = false; // Controla la visibilidad de la tarjeta de curiosidad

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Selecciona un animal',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.shuffle),
                  onPressed: () {
                    // Lógica para seleccionar un animal aleatorio
                  },
                ),
                DropdownButton<String>(
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Perro',
                      child: Text('Perro'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Gato',
                      child: Text('Gato'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Pájaro',
                      child: Text('Pájaro'),
                    ),
                    // Agrega más opciones según sea necesario
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _selectedAnimal = value; // Actualiza el animal seleccionado
                      if (_selectedAnimal != null) {
                        _showCuriosityCard = true; // Muestra la tarjeta de curiosidad al seleccionar un animal
                      }
                    });
                  },
                  hint: const Text('Selecciona un animal'),
                  value: _selectedAnimal, // Establece el valor seleccionado
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedAnimal != null) {
                      setState(() {
                        _showCuriosityCard = true; // Muestra la tarjeta de curiosidad al hacer clic en el botón "Enviar"
                      });
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
          if (_showCuriosityCard && _selectedAnimal != null) // Muestra la tarjeta de curiosidad si _showCuriosityCard es true y _selectedAnimal no es nulo
            CuriosityCard(
              onClose: () {
                setState(() {
                  _showCuriosityCard = false; // Oculta la tarjeta de curiosidad cuando se cierra
                });
              },
            ),
        ],
      ),
    );
  }
}

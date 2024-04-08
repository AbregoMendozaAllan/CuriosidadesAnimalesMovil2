import 'package:flutter/material.dart';
import 'components/bottom_navigation_bar.dart';

class NuevaCuriosidadScreen extends StatefulWidget {
  const NuevaCuriosidadScreen({Key? key}) : super(key: key);

  @override
  _NuevaCuriosidadScreenState createState() => _NuevaCuriosidadScreenState();
}

class _NuevaCuriosidadScreenState extends State<NuevaCuriosidadScreen> {
  int _selectedIndex = 0; // Default index of first screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Curiosidad'),
      ),
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
                    // Lógica para manejar la selección del animal
                  },
                  hint: const Text('Selecciona un animal'),
                  value: null,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para enviar el animal seleccionado
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

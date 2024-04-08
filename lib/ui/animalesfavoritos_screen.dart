import 'package:flutter/material.dart';
import 'components/bottom_navigation_bar.dart';

class AnimalesFavoritosScreen extends StatefulWidget {
  const AnimalesFavoritosScreen({super.key});

  @override
  _AnimalesFavoritosScreenState createState() => _AnimalesFavoritosScreenState();
}

class _AnimalesFavoritosScreenState extends State<AnimalesFavoritosScreen> {
  final List<String> _animalesSeleccionados = []; // Lista para almacenar los animales seleccionados

  // Lista de animales
  final List<String> _listaAnimales = [
    'Perro', 'Gato', 'Pájaro', 'León', 'Tigre', 'Elefante', 'Oso', 'Cebra', 'Jirafa', // Lista inicial
    'Zorro', 'Canguro', 'Delfín', 'Ballena', 'Hipopótamo', 'Mono', 'Cocodrilo', 'Tortuga', 'Pez', // Nuevos animales
    'Panda', 'Aguila', 'Pavo real', 'Conejo', 'Koala', 'Suricata', 'Rinoceronte', 'Zebra', 'Lobo', // Nuevos animales
    'Nutria', 'Mapache', 'Castor', 'Camello', 'Foca', 'Pulpo', 'Calamar', 'Pinguino', 'Pingüino', // Nuevos animales
    'Avestruz', 'Cebra', 'Coyote', 'Chita', 'Guepardo', 'Iguana', 'Búho', 'Aguila', 'Caracol', // Nuevos animales
    'Rana', 'Serpiente', 'Erizo', 'Cabra', 'Ornitorrinco', 'Suricata', 'Puma', 'Papagayo', 'Ratón', // Nuevos animales
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animales Favoritos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaAnimales.length,
              itemBuilder: (context, index) {
                final animal = _listaAnimales[index];
                final isChecked = _animalesSeleccionados.contains(animal);

                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading, // Mueve el checkbox a la izquierda
                  title: Text(animal),
                  value: isChecked,
                  dense: true, // Reduce el espacio entre elementos de la lista
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        _animalesSeleccionados.add(animal); // Agregar el animal seleccionado
                      } else {
                        _animalesSeleccionados.remove(animal); // Remover el animal no seleccionado
                      }
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Lógica para confirmar la selección de animales favoritos
              // Puedes imprimir la lista de animales seleccionados o ejecutar cualquier otra acción aquí
              print('Animales seleccionados: $_animalesSeleccionados');
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Puedes ajustar este índice según tus necesidades
        onTap: (int index) {
          // Lógica para manejar la navegación del BottomNavBar
        },
      ),
    );
  }
}

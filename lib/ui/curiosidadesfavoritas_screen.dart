import 'package:flutter/material.dart';
import 'components/curiosidad_favorita.dart';

class CuriosidadesFavoritasScreen extends StatelessWidget {
  const CuriosidadesFavoritasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curiosidades Favoritas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Your list of favorite curiosities widgets here
                // For demonstration purposes, I'll include a sample CuriosidadFavorita widget
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Logic to handle favorite change
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                // Add more CuriosidadFavorita widgets as needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, String animalName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminar de favoritos'),
          content: Text('¿Estás seguro de eliminar la curiosidad de $animalName de tus favoritos?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without deleting the curiosity
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Logic to remove the curiosity from favorites
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}

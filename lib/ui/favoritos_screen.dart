import 'package:flutter/material.dart';
import 'animalesfavoritos_screen.dart'; // Import the modal screen
import 'curiosidadesfavoritas_screen.dart'; // Import the CuriosidadesFavoritasScreen

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Open the modal screen for selecting favorite animals
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AnimalesFavoritosScreen()),
                );
              },
              child: const Text('Animales Favoritos'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Open the modal screen for favorite curiosities
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CuriosidadesFavoritasScreen()),
                );
              },
              child: const Text('Curiosidades Favoritas'),
            ),
          ],
        ),
      ),
    );
  }
}

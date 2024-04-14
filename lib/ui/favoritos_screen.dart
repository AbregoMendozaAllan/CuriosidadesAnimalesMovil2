import 'package:flutter/material.dart';
import 'animalesfavoritos_screen.dart';
import 'curiosidadesfavoritas_screen.dart';

class FavoritosScreen extends StatelessWidget {
  final String userId; // Add userId property

  const FavoritosScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Open the modal screen for selecting favorite animals
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimalesFavoritosScreen(userId: userId), // Pass userId
                  ),
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

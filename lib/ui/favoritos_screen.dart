import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'animalesfavoritos_screen.dart';
import 'curiosidadesfavoritas_screen.dart';

class FavoritosScreen extends StatelessWidget {
  final String userId;  

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimalesFavoritosScreen(userId: userId),
                  ),
                );
              },
              child: const Text('Animales Favoritos'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CuriosidadesFavoritasScreen(userId: userId)),
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

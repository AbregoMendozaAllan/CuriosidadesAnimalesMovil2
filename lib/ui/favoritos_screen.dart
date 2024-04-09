import 'package:flutter/material.dart';
import 'animalesfavoritos_screen.dart'; // Importa el archivo de la página de animales favoritos
import 'curiosidadesfavoritas_screen.dart'; // Importa el archivo de la página de curiosidades favoritas

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar has been removed
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 200, // Ancho del botón
              child: ElevatedButton(
                onPressed: () {
                  // Navegar a la página de animales favoritos al hacer clic en el botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AnimalesFavoritosScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20), // Espaciado vertical dentro del botón
                ),
                child: const Text('Animales favoritos', style: TextStyle(fontSize: 18)), // Tamaño del texto
              ),
            ),
          ),
          const SizedBox(height: 20), // Espacio entre botones
          Center(
            child: SizedBox(
              width: 200, // Ancho del botón
              child: ElevatedButton(
                onPressed: () {
                  // Navegar a la página de curiosidades favoritas al hacer clic en el botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CuriosidadesFavoritasScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20), // Espaciado vertical dentro del botón
                ),
                child: const Text('Curiosidades favoritas', style: TextStyle(fontSize: 18)), // Tamaño del texto
              ),
            ),
          ),
        ],
      ),
      // BottomNavigationBar has been removed
    );
  }
}

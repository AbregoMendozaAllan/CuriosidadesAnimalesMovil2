import 'package:flutter/material.dart';
import 'components/bottom_navigation_bar.dart';
import 'animalesfavoritos_screen.dart'; // Importa el archivo de la página de animales favoritos
import 'curiosidadesfavoritas_screen.dart'; // Importa el archivo de la página de curiosidades favoritas

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
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
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Puedes ajustar este índice según tus necesidades
        onTap: (int index) {
          // Lógica para manejar la navegación del BottomNavBar
        },
      ),
    );
  }
}

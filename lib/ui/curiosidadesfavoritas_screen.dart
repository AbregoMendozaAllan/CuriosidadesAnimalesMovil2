import 'package:flutter/material.dart';
import 'components/curiosidad_favorita.dart';
import 'components/bottom_navigation_bar.dart';

class CuriosidadesFavoritasScreen extends StatelessWidget {
  const CuriosidadesFavoritasScreen({super.key});

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
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Perro',
                  curiosity: 'Los perros son leales a sus dueños.',
                  emoji: '🐶',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del perro
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Perro');
                    }
                  },
                ),
                CuriosidadFavorita(
                  animalName: 'Gato',
                  curiosity: 'Los gatos tienen nueve vidas.',
                  emoji: '🐱',
                  isFavorite: true,
                  onFavoriteChanged: (bool isFavorite) {
                    // Lógica para cambiar el estado de favorito del gato
                    if (isFavorite) {
                      _showConfirmationDialog(context, 'Gato');
                    }
                  },
                ),
                // Agrega más curiosidades favoritas según sea necesario
              ],
            ),
          ),
          BottomNavBar(
            currentIndex: 0, // Puedes ajustar este índice según tus necesidades
            onTap: (int index) {
              // Lógica para manejar la navegación del BottomNavBar
            },
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
                Navigator.of(context).pop(); // Cierra el diálogo sin eliminar la curiosidad
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Aquí iría la lógica para eliminar la curiosidad de favoritos
                // Eliminar la curiosidad de favoritos
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}

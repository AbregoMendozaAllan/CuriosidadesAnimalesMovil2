// CuriosidadesFavoritasScreen.dart
import 'package:flutter/material.dart';
import 'components/curiosidad_favorita.dart';
import '../data/database_controller.dart';

class CuriosidadesFavoritasScreen extends StatefulWidget {
  const CuriosidadesFavoritasScreen({Key? key}) : super(key: key);

  @override
  _CuriosidadesFavoritasScreenState createState() => _CuriosidadesFavoritasScreenState();
}

class _CuriosidadesFavoritasScreenState extends State<CuriosidadesFavoritasScreen> {
  late List<Map<String, dynamic>> _favoriteCuriosities = [];
  late DatabaseController _dbController;

  @override
  void initState() {
    super.initState();
    _dbController = DatabaseController.instance;
    _fetchFavoriteCuriosities();
  }

  Future<void> _fetchFavoriteCuriosities() async {
    final userId = 'exampleUserId'; // Replace 'exampleUserId' with the actual userId
    final favoriteCuriosities = await _dbController.getFavoriteCuriositiesForUser(userId);
    setState(() {
      _favoriteCuriosities = favoriteCuriosities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curiosidades Favoritas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _favoriteCuriosities.length,
              itemBuilder: (context, index) {
                final curiosity = _favoriteCuriosities[index];
                return CuriosidadFavorita(
                  animalName: curiosity['animalName'] ?? '',
                  curiosity: curiosity['funFact'] ?? '',
                  emoji: curiosity['animalEmoji'] ?? '',
                  isFavorite: true, // Set to true since it's a favorite
                  curiosityId: curiosity['curiosityID'],
                  userId: curiosity['userID'],
                  onFavoriteChanged: (isFavorite) {
                    // Logic to handle favorite change
                    if (!isFavorite) {
                      _showConfirmationDialog(context, curiosity['animalName']);
                    }
                  },
                );
              },
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

import 'package:flutter/material.dart';
import 'package:curiosidadesanimalesmovil2/data/database_controller.dart';
import 'package:sqflite/sqflite.dart';
import 'components/curiosidad_favorita.dart';

class CuriosidadesFavoritasScreen extends StatefulWidget {
  final String userId; 

  const CuriosidadesFavoritasScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _CuriosidadesFavoritasScreenState createState() =>
      _CuriosidadesFavoritasScreenState();
}

class _CuriosidadesFavoritasScreenState
    extends State<CuriosidadesFavoritasScreen> {
  List<Map<String, dynamic>> _favoriteCuriosities = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteCuriosities();
  }

  Future<void> _loadFavoriteCuriosities() async {
    Database db = await DatabaseController.instance.database;

    final curiosities = await db.rawQuery('''
      SELECT f.curiosityID, c.funFact, a.animalName, a.animalEmoji 
      FROM funfacts c 
      INNER JOIN animals a ON a.animalID = c.animalID 
      INNER JOIN favorite_curiosity f ON c.curiosityID = f.curiosityID WHERE f.userID = ?
    ''', [widget.userId]); // Utilizar widget.userId para acceder al userId

    setState(() {
      _favoriteCuriosities = curiosities;
    });
  }

  Future<void> _removeFromFavorites(int curiosityID) async {
    Database db = await DatabaseController.instance.database;
    await db.delete(
      'favorite_curiosity',
      where: 'curiosityID = ?',
      whereArgs: [curiosityID],
    );

    await _loadFavoriteCuriosities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curiosidades Favoritas'),
      ),
      body: ListView.builder(
        itemCount: _favoriteCuriosities.length,
        itemBuilder: (context, index) {
          final curiosity = _favoriteCuriosities[index];
          return CuriosidadFavorita(
            animalName: curiosity['animalName'],
            curiosity: curiosity['funFact'],
            emoji: curiosity['animalEmoji'],
            isFavorite: true,
            onFavoriteChanged: (isFavorite) {
              if (!isFavorite) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Eliminar de favoritos'),
                      content: Text(
                          '¿Estás seguro de eliminar esta curiosidad de tus favoritos?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            _removeFromFavorites(
                                curiosity['curiosityID']); 
                            Navigator.of(context).pop(); 
                          },
                          child: const Text('Eliminar'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}

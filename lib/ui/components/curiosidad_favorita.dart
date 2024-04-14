// CuriosidadFavorita.dart
import 'package:flutter/material.dart';

import '../../data/database_controller.dart';

class CuriosidadFavorita extends StatefulWidget {
  final String animalName;
  final String curiosity;
  final String emoji;
  final bool isFavorite;
  final int curiosityId; // Added curiosityId
  final String userId; // Added userId
  final Function(bool) onFavoriteChanged;

  const CuriosidadFavorita({
    Key? key,
    required this.animalName,
    required this.curiosity,
    required this.emoji,
    required this.isFavorite,
    required this.curiosityId,
    required this.userId,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  _CuriosidadFavoritaState createState() => _CuriosidadFavoritaState();
}

class _CuriosidadFavoritaState extends State<CuriosidadFavorita> {
  late bool _isFavorite;
  late DatabaseController _dbController;

  @override
  void initState() {
    super.initState();
    _dbController = DatabaseController.instance;
    _checkIfCuriosityIsFavorite(); // Check if the curiosity is favorited
  }

  // Method to check if the curiosity is favorited by the current user
  Future<void> _checkIfCuriosityIsFavorite() async {
    bool isFavorite = await _dbController.isCuriosityFavorite(widget.curiosityId, widget.userId);
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(
              widget.emoji,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.animalName,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    widget.curiosity,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
                await _dbController.updateFavoriteCuriosities(widget.userId, widget.curiosityId, _isFavorite); // Update favorite status in the database
                widget.onFavoriteChanged(_isFavorite);
              },
              icon: Icon(
                Icons.star,
                color: _isFavorite ? Colors.amber : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

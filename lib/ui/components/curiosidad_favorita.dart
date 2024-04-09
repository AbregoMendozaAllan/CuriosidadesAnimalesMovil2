import 'package:flutter/material.dart';

class CuriosidadFavorita extends StatelessWidget {
  final String animalName;
  final String curiosity;
  final String emoji;
  final bool isFavorite;
  final Function(bool) onFavoriteChanged;

  const CuriosidadFavorita({
    Key? key,
    required this.animalName,
    required this.curiosity,
    required this.emoji,
    required this.isFavorite,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animalName,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    curiosity,
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // Llama a la función onFavoriteChanged pasando el nuevo estado de favorito
                onFavoriteChanged(!isFavorite);
              },
              icon: Icon(
                Icons.star,
                color: isFavorite ? Colors.amber : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

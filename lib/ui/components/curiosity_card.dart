import 'package:flutter/material.dart';

class CuriosityCard extends StatefulWidget {
  final VoidCallback onClose;
  final String animalName;
  final String emoji;
  final String curiosity;

  const CuriosityCard({
    Key? key,
    required this.onClose,
    required this.animalName,
    required this.emoji,
    required this.curiosity,
  }) : super(key: key);

  @override
  _CuriosityCardState createState() => _CuriosityCardState();
}

class _CuriosityCardState extends State<CuriosityCard> {
  bool _isFavorite = false;

  void _toggleFavorite() async {
    if (_isFavorite) {
      // Remove the curiosity from favorite_curiosity table
      // You would need to implement this method in DatabaseController
      // based on the user ID and the current curiosity
      // For demonstration, I'm just setting _isFavorite to false
      setState(() {
        _isFavorite = false;
      });
    } else {
      // Add the curiosity to favorite_curiosity table
      // You would need to implement this method in DatabaseController
      // based on the user ID and the current curiosity
      // For demonstration, I'm just setting _isFavorite to true
      setState(() {
        _isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              widget.emoji,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.animalName,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.curiosity,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: _toggleFavorite,
              icon: Icon(
                _isFavorite ? Icons.star : Icons.star_border,
                color: _isFavorite ? Colors.amber : null,
              ),
            ),
            IconButton(
              onPressed: widget.onClose,
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}

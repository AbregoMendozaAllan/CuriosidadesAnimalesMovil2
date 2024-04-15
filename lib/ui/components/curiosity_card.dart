import 'package:flutter/material.dart';
import '../../data/database_controller.dart';

class CuriosityCard extends StatefulWidget {
  final VoidCallback onClose;
  final String userId;
  final Map<String, dynamic>? selectedCuriosity;
  final String animalName;
  final String emoji;
  final String curiosity;

  const CuriosityCard({
    Key? key,
    required this.onClose,
    required this.userId,
    required this.selectedCuriosity,
    required this.animalName,
    required this.emoji,
    required this.curiosity,
  }) : super(key: key);

  @override
  _CuriosityCardState createState() => _CuriosityCardState();
}

class _CuriosityCardState extends State<CuriosityCard> {
  bool _isFavorite = false; 

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
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
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.animalName,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.curiosity,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: _toggleFavorite,
              icon: Icon(
                Icons.star,
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
  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      if (_isFavorite) {
        DatabaseController.instance.insertFavoriteCuriosity(widget.userId, widget.selectedCuriosity!['curiosityID']);
      } else {
        DatabaseController.instance.removeFavoriteCuriosity(widget.userId, widget.selectedCuriosity!['curiosityID']);
      }
    });
  }
}

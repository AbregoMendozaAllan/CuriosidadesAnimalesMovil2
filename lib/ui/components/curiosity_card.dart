import 'package:flutter/material.dart';

class CuriosityCard extends StatefulWidget {
  final VoidCallback onClose;

  const CuriosityCard({Key? key, required this.onClose}) : super(key: key);

  @override
  _CuriosityCardState createState() => _CuriosityCardState();
}

class _CuriosityCardState extends State<CuriosityCard> {
  bool _isFavorite = false; // Estado interno para rastrear si se ha agregado a favoritos

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
            IconButton(
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite; // Cambia el estado de favoritos al hacer clic en el botón
                });
              },
              icon: Icon(
                _isFavorite ? Icons.star : Icons.star_border, // Cambia el icono según si se ha agregado a favoritos o no
                color: _isFavorite ? Colors.amber : null, // Cambia el color del icono si se ha agregado a favoritos
              ),
            ),
            const Expanded(
              child: Text(
                'Esta es la curiosidad',
                style: TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
              onPressed: widget.onClose, // Llama a la función onClose para cerrar la tarjeta
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}

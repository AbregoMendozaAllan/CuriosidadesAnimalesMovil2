import 'package:flutter/material.dart';

void main() {
  runApp(const AnimalCard(name: 'lion', description: 'lorem', emoji: '',));
}

class AnimalCard extends StatelessWidget {
  final String name;
  final String description;
  final String emoji;

  const AnimalCard({
    super.key,
    required this.name,
    required this.description,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card wrap its content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0), // For spacing
            Text(
              description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0), // For spacing
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                emoji,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

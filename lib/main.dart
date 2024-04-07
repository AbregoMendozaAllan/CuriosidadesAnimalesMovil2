import 'package:curiosidadesanimalesmovil2/ui/components/animal_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animal Cards'),
        ),
        body: const Center(
          child: AnimalCard(
            name: 'Lion',
            description: 'The lion is a species in the family Felidae; it is a muscular, deep-chested cat with a short, rounded head, a reduced neck and round ears, and a hairy tuft at the end of its tail.',
            emoji: '🦁',
          ),
        ),
      ),
    );
  }
}

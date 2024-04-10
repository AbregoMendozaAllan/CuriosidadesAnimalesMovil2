import 'package:flutter/material.dart';
import 'components/animal_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome, User!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                AnimalCard(name: 'Cat', description: 'dato de un gato', emoji: '🐱',),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0, bottom: 10.0),
                  child: Text(
                    'Historial',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AnimalCard(name: 'Cat', description: 'dato de un gato', emoji: '🐱',),
                AnimalCard(name: 'Cat', description: 'dato de un gato', emoji: '🐱',),
                AnimalCard(name: 'Cat', description: 'dato de un gato', emoji: '🐱',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'components/animal_card.dart';
import '../data/database_controller.dart';

class MyHomePage extends StatelessWidget {
  final String userId;

  const MyHomePage({Key? key, required this.userId}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenido $userId', 
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  FutureBuilder(
                    future: _getRandomCuriosity(),
                    builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final curiosity = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Curiosidad Aleatoria:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              AnimalCard(
                                name: curiosity['animalName'],
                                description: curiosity['funFact'],
                                emoji: curiosity['animalEmoji'],
                              ),
                            ],
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  FutureBuilder(
                    future: _getLastTenCuriosities(),
                    builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final curiosities = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text(
                                  'Últimas Curiosidades:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              for (var curiosity in curiosities)
                                AnimalCard(
                                  name: curiosity['animalName'],
                                  description: curiosity['funFact'],
                                  emoji: curiosity['animalEmoji'],
                                ),
                            ],
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> _getRandomCuriosity() async {
    Database db = await DatabaseController.instance.database;
    List<Map<String, dynamic>> curiosities = await db.rawQuery('''
      SELECT c.curiosityID, c.funFact, a.animalName, a.animalEmoji 
      FROM funfacts c 
      INNER JOIN animals a ON a.animalID = c.animalID 
      ORDER BY RANDOM() LIMIT 1
    ''');

    if (curiosities.isNotEmpty) {
      return curiosities[0]; 
    } else {
      return null; 
    }
  }

  Future<List<Map<String, dynamic>>> _getLastTenCuriosities() async {
    Database db = await DatabaseController.instance.database;
    List<Map<String, dynamic>> curiosities = await db.rawQuery('''
      SELECT c.curiosityID, c.funFact, a.animalName, a.animalEmoji
      FROM history h
      INNER JOIN funfacts c ON c.curiosityID = h.curiosityID
      INNER JOIN animals a ON a.animalID = c.animalID WHERE h.userID = ?
      ORDER BY h.dateAdded DESC
      LIMIT 10
    ''', [userId]);
    return curiosities;
  }
}

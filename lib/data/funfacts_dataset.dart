import 'package:sqflite/sqflite.dart';

class FunFactsDataset {
  static Future<void> insertInitialData(Database db) async {
    // Add users
    await _addUsers(db);

    // Add animals
    await _addAnimals(db);

    // Add favorite animals for admin001
    await _addFavoriteAnimals(db);

    // Add favorite curiosities for admin001
    await _addFavoriteCuriosities(db);
  }

  static Future<void> _addUsers(Database db) async {
    List<Map<String, dynamic>> users = [
      {
        'userID': 'admin001',
        'name': 'Admin',
        'lastName': 'User',
        'email': 'admin@animals.com',
        'password': 'adminPass123' // For example purposes, never store passwords as plain text in production
      },
      {
        'userID': 'test001',
        'name': 'Test',
        'lastName': 'User',
        'email': 'test@animals.com',
        'password': 'testPass123'
      }
    ];

    for (var user in users) {
      await db.insert('user', user);
    }
  }

  static Future<void> _addAnimals(Database db) async {
    List<Map<String, dynamic>> animals = [
      {'animalName': 'Elephant', 'animalEmoji': '🐘'},
      {'animalName': 'Tiger', 'animalEmoji': '🐅'},
      {'animalName': 'Octopus', 'animalEmoji': '🐙'},
      {'animalName': 'Kangaroo', 'animalEmoji': '🦘'},
      {'animalName': 'Penguin', 'animalEmoji': '🐧'}
    ];

    for (var animal in animals) {
      int animalID = await db.insert('animals', animal);
      await _addFunFactsForAnimal(db, animalID, animal['animalName']);
    }
  }

  static Future<void> _addFunFactsForAnimal(Database db, int animalID, String animalName) async {
    List<Map<String, dynamic>> funFacts = [];

    switch (animalName) {
      case 'Elephant':
        funFacts = [
          {'funFact': 'Elephants can live up to 70 years in the wild.'},
          {'funFact': 'An elephant\'s trunk has more than 40,000 muscles.'},
          {'funFact': 'Elephants have a strong memory and can remember locations of water sources over long distances.'},
          {'funFact': 'Elephants communicate using a variety of sounds, infrasound, and vibrations.'},
          {'funFact': 'Elephants are herbivores and can consume up to 300 pounds of food in a single day.'}
        ];
        break;
      case 'Tiger':
        funFacts = [
          {'funFact': 'Tigers are the largest cat species in the world.'},
          {'funFact': 'Tigers have striped skin, not just striped fur.'},
          {'funFact': 'Tigers are solitary animals and usually hunt alone at night.'},
          {'funFact': 'A group of tigers is called a streak or an ambush.'},
          {'funFact': 'Tigers have a powerful sense of smell and can detect scents over long distances.'}
        ];
        break;
      case 'Octopus':
        funFacts = [
          {'funFact': 'Octopuses have three hearts and blue blood.'},
          {'funFact': 'Octopuses are known for their intelligence and problem-solving abilities.'},
          {'funFact': 'Octopuses can change color and texture to camouflage with their surroundings.'},
          {'funFact': 'Octopuses have eight arms lined with suckers for grasping and manipulating objects.'},
          {'funFact': 'Some octopus species are venomous and can deliver a painful bite.'}
        ];
        break;
      case 'Kangaroo':
        funFacts = [
          {'funFact': 'Kangaroos are marsupials, meaning they carry their young in a pouch.'},
          {'funFact': 'Kangaroos are excellent jumpers and can leap up to 30 feet in a single bound.'},
          {'funFact': 'Kangaroos are found only in Australia and nearby islands.'},
          {'funFact': 'Kangaroos use their tails for balance while hopping.'},
          {'funFact': 'A group of kangaroos is called a mob or a troop.'}
        ];
        break;
      case 'Penguin':
        funFacts = [
          {'funFact': 'Penguins are birds, but they cannot fly.'},
          {'funFact': 'Penguins live almost exclusively in the Southern Hemisphere.'},
          {'funFact': 'Penguins are excellent swimmers and can dive to great depths in search of food.'},
          {'funFact': 'Penguins form long-term pair bonds and often mate for life.'},
          {'funFact': 'Emperor penguins are the tallest species, standing up to 3.7 feet tall.'}
        ];
        break;
    }

    for (var fact in funFacts) {
      await db.insert('funfacts', {
        'animalID': animalID,
        'funFact': fact['funFact'],
      });
    }
  }

  static Future<void> _addFavoriteAnimals(Database db) async {
    await db.insert('favorite_animals', {'userID': 'admin001', 'animalID': 1});
    await db.insert('favorite_animals', {'userID': 'admin001', 'animalID': 2});
  }

  static Future<void> _addFavoriteCuriosities(Database db) async {
    List<Map<String, dynamic>> favoriteCuriosities = [
      {'curiosityID': 1, 'userID': 'admin001', 'dateAdded': DateTime.now().toIso8601String()},
      {'curiosityID': 2, 'userID': 'admin001', 'dateAdded': DateTime.now().toIso8601String()},
      {'curiosityID': 3, 'userID': 'admin001', 'dateAdded': DateTime.now().toIso8601String()},
      {'curiosityID': 4, 'userID': 'admin001', 'dateAdded': DateTime.now().toIso8601String()},
      {'curiosityID': 5, 'userID': 'admin001', 'dateAdded': DateTime.now().toIso8601String()},
    ];

    for (var curiosity in favoriteCuriosities) {
      await db.insert('favorite_curiosity', curiosity);
    }
  }
}

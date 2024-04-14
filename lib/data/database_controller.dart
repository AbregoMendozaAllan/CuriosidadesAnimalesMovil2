import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'funfacts_dataset.dart';

class DatabaseController {
  static Database? _database;

  DatabaseController._privateConstructor();

  static final DatabaseController instance =
      DatabaseController._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'funfacts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create the user table
        await db.execute('''
CREATE TABLE user(
  userID TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  lastName TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL
);
''');

        // Create the animals table
        await db.execute('''
CREATE TABLE animals(
  animalID INTEGER PRIMARY KEY AUTOINCREMENT,
  animalName TEXT NOT NULL,
  animalEmoji TEXT NOT NULL
);
''');

        // Create the funfacts table
        await db.execute('''
CREATE TABLE funfacts(
  curiosityID INTEGER PRIMARY KEY AUTOINCREMENT,
  funFact TEXT NOT NULL,
  animalID INTEGER,
  state BOOLEAN NOT NULL DEFAULT 1,
  FOREIGN KEY (animalID) REFERENCES animals (animalID)
);
''');

        // Create the favorite_animals table
        await db.execute('''
CREATE TABLE favorite_animals(
  userID TEXT,
  animalID INTEGER,
  PRIMARY KEY(userID, animalID),
  FOREIGN KEY (userID) REFERENCES user (userID),
  FOREIGN KEY (animalID) REFERENCES animals (animalID)
);
''');

        // Create the favorite_curiosity table
        await db.execute('''
CREATE TABLE favorite_curiosity(
  curiosityID INTEGER,
  userID TEXT,
  dateAdded TEXT NOT NULL,
  PRIMARY KEY(curiosityID, userID),
  FOREIGN KEY (curiosityID) REFERENCES Curiosity (curiosityID),
  FOREIGN KEY (userID) REFERENCES user (userID)
);
''');
        // Insert initial data
        await FunFactsDataset.insertInitialData(db);
        // You would call these functions somewhere in your setup or as part of a user interaction:


      },
    );
  }

  Future<Map<String, dynamic>?> authenticateUser(
      String userID, String password) async {
    final db = await instance.database;
    final result = await db.query(
      'user',
      where: 'userID = ? AND password = ?',
      whereArgs: [userID, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> getRandomFunFact() async {
    final db = await instance.database;
    final result = await db.query(
      'funfacts',
      orderBy: 'RANDOM()',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> registerUser(String username, String firstName,
      String lastName, String email, String password) async {
    final db = await instance.database;
    try {
      await db.insert(
        'user',
        {
          'userID': username,
          'name': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        },
      );
      return {
        'userID': username,
        'name': firstName,
        'lastName': lastName,
        'email': email,
      };
    } catch (e) {
      print('Error registering user: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserData(String userID) async {
    final db = await instance.database;
    final result = await db.query(
      'user',
      where: 'userID = ?',
      whereArgs: [userID],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<void> updateUserData(
      String userID, String name, String lastName, String email) async {
    final db = await instance.database;
    await db.update(
      'user',
      {
        'name': name,
        'lastName': lastName,
        'email': email,
      },
      where: 'userID = ?',
      whereArgs: [userID],
    );
  }

  Future<void> changeUserPassword(String userID, String newPassword) async {
    final db = await instance.database;
    await db.update(
      'user',
      {'password': newPassword},
      where: 'userID = ?',
      whereArgs: [userID],
    );
  }

  Future<void> addFavoriteAnimals(String userID, List<int> animalIDs) async {
    final db = await instance.database;
    for (int animalID in animalIDs) {
      await db
          .insert('favorite_animals', {'userID': userID, 'animalID': animalID});
    }
  }

  Future<void> addFavoriteCuriosities(
      String userID, List<int> curiosityIDs) async {
    final db = await instance.database;
    String dateAdded = DateTime.now().toIso8601String();
    for (int curiosityID in curiosityIDs) {
      await db.insert('favorite_curiosity', {
        'curiosityID': curiosityID,
        'userID': userID,
        'dateAdded': dateAdded
      });
    }
  }

  Future<List<Map<String, dynamic>>> getAllAnimals() async {
    final db = await instance.database;
    return await db.query('animals');
  }

  Future<List<Map<String, dynamic>>> getFavoriteAnimalsForUser(String userID) async {
    final db = await instance.database;
    return await db.query(
      'favorite_animals',
      where: 'userID = ?',
      whereArgs: [userID],
    );
  }

  Future<void> removeFavoriteAnimals(String userID, List<int> animalIDs) async {
    final db = await instance.database;
    for (int animalID in animalIDs) {
      await db.delete(
        'favorite_animals',
        where: 'userID = ? AND animalID = ?',
        whereArgs: [userID, animalID],
      );
    }
  }

  Future<void> updateFavoriteAnimals(String userID, List<int> animalIDs) async {
    final db = await instance.database;
    // First, delete all existing favorite animals for the user
    await db.delete(
      'favorite_animals',
      where: 'userID = ?',
      whereArgs: [userID],
    );
    // Then, insert the new list of favorite animals for the user
    for (int animalID in animalIDs) {
      await db.insert('favorite_animals', {'userID': userID, 'animalID': animalID});
    }
  }

  Future<Map<String, dynamic>?> getFunFactForAnimal(int animalID) async {
    final db = await instance.database;
    final result = await db.query(
      'funfacts',
      where: 'animalID = ?',
      whereArgs: [animalID],
      orderBy: 'RANDOM()',
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

// Method to check if the curiosity is favorited by the current user
  Future<bool> isCuriosityFavorite(int curiosityId, String userId) async {
    final db = await instance.database;
    final result = await db.query(
      'favorite_curiosity',
      where: 'curiosityID = ? AND userID = ?',
      whereArgs: [curiosityId, userId],
    );
    return result.isNotEmpty;
  }

  // DatabaseController.dart

  Future<void> removeFavoriteCuriosities(String userID, List<int> curiosityIDs) async {
    final db = await instance.database;
    for (int curiosityID in curiosityIDs) {
      await db.delete(
        'favorite_curiosity',
        where: 'userID = ? AND curiosityID = ?',
        whereArgs: [userID, curiosityID],
      );
    }
  }

  // Inside DatabaseController class

  Future<List<Map<String, dynamic>>> getFavoriteCuriositiesForUser(String userId) async {
    final db = await instance.database;
    return await db.query(
      'favorite_curiosity',
      where: 'userID = ?',
      whereArgs: [userId],
    );
  }

  Future<Map<String, dynamic>?> getAnimalByName(String animalName) async {
    // Implement the logic to fetch animal details from the database by name
    // Replace the following line with your actual implementation
    return {'animalID': 1}; // Placeholder, replace with actual data
  }

  Future<void> updateFavoriteCuriosities(String userId, int curiosityId, bool isFavorite) async {
    final db = await instance.database;
    if (isFavorite) {
      await db.insert('favorite_curiosity', {
        'curiosityID': curiosityId,
        'userID': userId,
        'dateAdded': DateTime.now().toIso8601String(),
      });
    } else {
      await db.delete(
        'favorite_curiosity',
        where: 'curiosityID = ? AND userID = ?',
        whereArgs: [curiosityId, userId],
      );
    }
  }



}

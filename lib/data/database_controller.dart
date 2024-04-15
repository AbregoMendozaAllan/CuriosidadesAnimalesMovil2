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
        
        await db.execute('''
CREATE TABLE user(
  userID TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  lastName TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL
);
''');

       
        await db.execute('''
CREATE TABLE animals(
  animalID INTEGER PRIMARY KEY AUTOINCREMENT,
  animalName TEXT NOT NULL,
  animalEmoji TEXT NOT NULL
);
''');

    
        await db.execute('''
CREATE TABLE funfacts(
  curiosityID INTEGER PRIMARY KEY AUTOINCREMENT,
  funFact TEXT NOT NULL,
  animalID INTEGER,
  state BOOLEAN NOT NULL DEFAULT 1,
  FOREIGN KEY (animalID) REFERENCES animals (animalID)
);
''');

        
        await db.execute('''
CREATE TABLE favorite_animals(
  userID TEXT,
  animalID INTEGER,
  PRIMARY KEY(userID, animalID),
  FOREIGN KEY (userID) REFERENCES user (userID),
  FOREIGN KEY (animalID) REFERENCES animals (animalID)
);
''');

       
        await db.execute('''
CREATE TABLE favorite_curiosity(
  curiosityID INTEGER,
  userID TEXT,
  PRIMARY KEY(curiosityID, userID),
  FOREIGN KEY (curiosityID) REFERENCES Curiosity (curiosityID),
  FOREIGN KEY (userID) REFERENCES user (userID)
);
''');
        await db.execute('''
CREATE TABLE history(
  curiosityID INTEGER,
  userID TEXT,
  dateAdded TEXT NOT NULL,
  PRIMARY KEY(curiosityID, userID),
  FOREIGN KEY (curiosityID) REFERENCES Curiosity (curiosityID),
  FOREIGN KEY (userID) REFERENCES user (userID)
);
''');
        
        await FunFactsDataset.insertInitialData(db);
        
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
    for (int curiosityID in curiosityIDs) {
      await db.insert('favorite_curiosity', {
        'curiosityID': curiosityID,
        'userID': userID,
      });
    }
  }

  Future<List<Map<String, dynamic>>> getAllAnimals() async {
    final db = await instance.database;
    return await db.query('animals');
  }

  Future<List<Map<String, dynamic>>> getFavoriteAnimalsForUser(
      String userID) async {
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
    
    await db.delete(
      'favorite_animals',
      where: 'userID = ?',
      whereArgs: [userID],
    );
   
    for (int animalID in animalIDs) {
      await db
          .insert('favorite_animals', {'userID': userID, 'animalID': animalID});
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

  Future<void> insertFavoriteCuriosity(String userId, int curiosityID) async {
    final db = await database;
    await db.insert(
      'favorite_curiosity',
      {'curiosityID': curiosityID, 'userID': userId},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeFavoriteCuriosity(String userId, int curiosityID) async {
    final db = await database;
    await db.delete(
      'favorite_curiosity',
      where: 'curiosityID = ? AND userID = ?',
      whereArgs: [curiosityID, userId],
    );
  }

  Future<Map<String, dynamic>?> getAnimalByName(String animalName) async {
    return {'animalID': 1}; 
  }
}

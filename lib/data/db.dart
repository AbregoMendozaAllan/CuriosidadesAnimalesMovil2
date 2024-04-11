import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    String path = join(await getDatabasesPath(), 'curiosidadesanimales.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Creating the User table
        await db.execute('''
CREATE TABLE user(
  userID TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  lastName TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL
);
''');

        // Creating the 'animals' table
        await db.execute('''
CREATE TABLE animals(
  animalID INTEGER PRIMARY KEY AUTOINCREMENT,
  animalName TEXT NOT NULL,
  animalEmoji TEXT NOT NULL
);
''');

        // Creating the 'Curiosity' table
        await db.execute('''
CREATE TABLE Curiosity(
  curiosityID INTEGER PRIMARY KEY AUTOINCREMENT,
  curiosity TEXT NOT NULL,
  animalID INTEGER,
  state BOOLEAN NOT NULL,
  FOREIGN KEY (animalID) REFERENCES animals (animalID)
);
''');

        // Creating the 'favorite_animals' table with a compound key
        await db.execute('''
CREATE TABLE favorite_animals(
  userID TEXT,
  animalID INTEGER,
  PRIMARY KEY(userID, animalID),
  FOREIGN KEY (userID) REFERENCES user (userID),
  FOREIGN KEY (animalID) REFERENCES animals (animalID)
);
''');

        // Creating the 'favorite_curiosity' table with a compound key
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

        // Adding admin user
        await db.rawInsert('''
INSERT INTO user(userID, name, lastName, email, password)
VALUES ('admin', 'Admin', 'User', 'admin@example.com', 'admin123');
''');

        // Adding animals
        await db.rawInsert('''
INSERT INTO animals(animalName, animalEmoji)
VALUES 
  ('Elefante', '🐘'),
  ('Flamenco', '🦩');
''');

        // Adding fun facts
        await db.rawInsert('''
INSERT INTO Curiosity(curiosity, animalID, state)
VALUES 
  ('Los elefantes son los únicos mamíferos que no pueden saltar', 1, 1),
  ('Los flamencos pueden vivir hasta 50 años', 2, 1),
  ('Los elefantes pueden recordar y reconocerse entre sí después de años de separación', 1, 1),
  ('Los flamencos son rosa debido a su dieta rica en betacaroteno', 2, 1),
  ('Los elefantes pueden comunicarse a larga distancia a través de infrasonidos', 1, 1),
  ('Los flamencos duermen de pie', 2, 1),
  ('Los elefantes tienen orejas grandes para ayudar a disipar el calor', 1, 1),
  ('Los flamencos son excelentes nadadores', 2, 1),
  ('Los elefantes pueden vivir hasta 70 años', 1, 1),
  ('Los flamencos son monógamos y a menudo regresan al mismo lugar para criar', 2, 1),
  ('Los elefantes pueden sentir vibraciones en el suelo a través de sus pies', 1, 1),
  ('Los flamencos pueden correr hasta 55 km/h', 2, 1),
  ('Los elefantes tienen una gestación de casi dos años', 1, 1),
  ('Los flamencos se alimentan con su cabeza boca abajo', 2, 1),
  ('Los elefantes tienen una excelente memoria', 1, 1),
  ('Los flamencos son capaces de volar a grandes altitudes', 2, 1),
  ('Los elefantes son adorados y venerados en varias culturas', 1, 1),
  ('Los flamencos construyen nidos de barro para poner sus huevos', 2, 1),
  ('Los elefantes pueden distinguir diferentes idiomas humanos', 1, 1),
  ('Los flamencos son altamente sociables y viven en grandes colonias', 2, 1),
  ('Los elefantes pueden oír sonidos infrasónicos hasta 10 km de distancia', 1, 1),
  ('Los flamencos tienen un pico especializado para filtrar su alimento', 2, 1),
  ('Los elefantes tienen una trompa extremadamente versátil', 1, 1),
  ('Los flamencos se alimentan de crustáceos y algas', 2, 1),
  ('Los elefantes pueden reconocerse en un espejo', 1, 1),
  ('Los flamencos pueden pasar hasta un 80% de su tiempo buscando alimento', 2, 1),
  ('Los elefantes pueden llorar', 1, 1),
  ('Los flamencos forman parejas para toda la vida', 2, 1),
  ('Los elefantes tienen una estructura social compleja', 1, 1),
  ('Los flamencos son famosos por su coloración única', 2, 1),
  ('Los elefantes son excelentes nadadores y disfrutan del agua', 1, 1),
  ('Los flamencos pueden sobrevivir en aguas salinas', 2, 1),
  ('Los elefantes pueden distinguir entre voces humanas amigables y hostiles', 1, 1),
  ('Los flamencos pueden migrar grandes distancias', 2, 1),
  ('Los elefantes tienen un sentido del olfato muy agudo', 1, 1),
  ('Los flamencos son considerados una especie indicadora de la salud de los humedales', 2, 1),
  ('Los elefantes tienen una piel muy sensible', 1, 1),
  ('Los flamencos pueden sobrevolar grandes áreas de agua buscando alimento', 2, 1),
  ('Los elefantes pueden producir una variedad de sonidos, incluidos gruñidos, chirridos y trompetas', 1, 1),
  ('Los flamencos tienen una vista excepcional', 2, 1),
  ('Los elefantes tienen un fuerte sentido del compañerismo y la empatía', 1, 1);
''');

        // Adding admin user's favorite animal
        await db.rawInsert('''
INSERT INTO favorite_animals(userID, animalID) VALUES ('admin', 1);
''');

        // Adding admin user's favorite curiosity
        await db.rawInsert('''
INSERT INTO favorite_curiosity(curiosityID, userID, dateAdded) VALUES (1, 'admin', CURRENT_TIMESTAMP);
''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> queryAllAnimals() async {
    Database db = await instance.database;
    return await db.query('animals');
  }

  Future<List<Map<String, dynamic>>> queryAllCuriosities() async {
    Database db = await instance.database;
    return await db.query('Curiosity');
  }

  Future<List<Map<String, dynamic>>> queryFavoriteAnimals(String userID) async {
    Database db = await instance.database;
    return await db
        .query('favorite_animals', where: 'userID = ?', whereArgs: [userID]);
  }

  Future<List<Map<String, dynamic>>> queryCuriositiesByAnimalID(
      int animalID) async {
    Database db = await instance.database;
    return await db
        .query('Curiosity', where: 'animalID = ?', whereArgs: [animalID]);
  }

  Future<void> addFavoriteCuriosity(
      int curiosityID, String userID, String dateAdded) async {
    Database db = await instance.database;
    await db.rawInsert(
        'INSERT INTO favorite_curiosity(curiosityID, userID, dateAdded) VALUES (?, ?, ?)',
        [curiosityID, userID, dateAdded]);
  }

  Future<bool> checkIfCuriosityIsFavorite(
      int curiosityID, String userID) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'favorite_curiosity',
      where: 'curiosityID = ? AND userID = ?',
      whereArgs: [curiosityID, userID],
    );

    // If result is not empty, the curiosity is already a favorite for the user
    return result.isNotEmpty;
  }

  // Function to add information to the 'user' table
  Future<void> addUser(String userID, String name, String lastName,
      String email, String password) async {
    Database db = await instance.database;
    await db.rawInsert(
        'INSERT INTO user(userID, name, lastName, email, password) VALUES (?, ?, ?, ?, ?)',
        [userID, name, lastName, email, password]);
  }

  // Function to add information to the 'animals' table
  Future<void> addAnimal(String animalName, String animalEmoji) async {
    Database db = await instance.database;
    await db.rawInsert(
        'INSERT INTO animals(animalName, animalEmoji) VALUES (?, ?)',
        [animalName, animalEmoji]);
  }

  // Function to add information to the 'Curiosity' table
  Future<void> addCuriosity(String curiosity, int animalID, bool state) async {
    Database db = await instance.database;
    await db.rawInsert(
        'INSERT INTO Curiosity(curiosity, animalID, state) VALUES (?, ?, ?)',
        [curiosity, animalID, state ? 1 : 0]);
  }

  Future<bool> validateUser(String username, String password) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'user',
      where: 'userID = ? AND password = ?',
      whereArgs: [username, password],
    );

    // If result is not empty, username and password match a user in the database
    return result.isNotEmpty;
  }
}

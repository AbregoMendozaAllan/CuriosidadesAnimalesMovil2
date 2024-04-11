import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseController {
  static Database? _database;

  DatabaseController._privateConstructor();

  static final DatabaseController instance = DatabaseController._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'curiosidades.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE animales (
            idAnimal INTEGER PRIMARY KEY,
            nombreAnimal TEXT NOT NULL,
            emojiAnimal TEXT NOT NULL
          )
        ''');

        // Insertar datos de ejemplo
        await db.execute('''
          INSERT INTO animales (nombreAnimal, emojiAnimal) 
          VALUES ('Perro', '🐶'), ('Gato', '🐱'), ('Pájaro', '🐦'), ('Caballos', '🐎') 
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> queryAllAnimals() async {
    Database db = await instance.database;
    return await db.query('animales');
  }
}

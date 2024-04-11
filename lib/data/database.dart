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

        await db.execute('''
          CREATE TABLE animalesFavoritos (
            idUsuario INTEGER NOT NULL,
            idAnimal INTEGER NOT NULL,
            PRIMARY KEY (idUsuario, idAnimal),
            FOREIGN KEY (idAnimal) REFERENCES animales(idAnimal)
          )
        ''');

        await db.execute('''
          CREATE TABLE curiosidades (
            idCuriosidad INTEGER PRIMARY KEY,
            curiosidad TEXT NOT NULL,
            idAnimal INTEGER NOT NULL,
            estadoCuriosidad INTEGER NOT NULL,
            FOREIGN KEY (idAnimal) REFERENCES animales(idAnimal)
          )
        ''');

        await db.execute('''
          CREATE TABLE curiosidadFavorita (
            idCuriosidad INTEGER NOT NULL,
            idUsuario INTEGER NOT NULL,
            PRIMARY KEY (idCuriosidad, idUsuario),
            FOREIGN KEY (idCuriosidad) REFERENCES curiosidades(idCuriosidad)
          )
        ''');

        await db.execute('''
          CREATE TABLE historialCuriosidades (
            idCuriosidad INTEGER NOT NULL,
            idUsuario INTEGER NOT NULL,
            fechaCuriosidad DATE NOT NULL,
            PRIMARY KEY (idCuriosidad, idUsuario),
            FOREIGN KEY (idCuriosidad) REFERENCES curiosidades(idCuriosidad)
          )
        ''');

        await db.execute('''
          CREATE TABLE usuario (
            idUsuario INTEGER PRIMARY KEY,
            nombreUsuario TEXT NOT NULL,
            apellidoUsuario TEXT NOT NULL,
            correoUsuario TEXT NOT NULL,
            usuario TEXT NOT NULL
          )
        ''');



      },
    );
  }

  Future<List<Map<String, dynamic>>> queryAllAnimals() async {
    Database db = await instance.database;
    return await db.query('animales');
  }
}

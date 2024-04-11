import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:curiosidadesanimalesmovil2/ui/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class DatabaseExample extends StatefulWidget {
  @override
  _DatabaseExampleState createState() => _DatabaseExampleState();
}

class _DatabaseExampleState extends State<DatabaseExample> {
  Database? _database;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'example.db');
    _database = await openDatabase(
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

        // Insertar datos de ejemplo
        await db.execute('''
          INSERT INTO usuario (nombreUsuario, apellidoUsuario, correoUsuario, usuario) 
          VALUES ('Juan', 'Pérez', 'juan@example.com', 'juanperez')
        ''');

        await db.execute('''
          INSERT INTO animales (nombreAnimal, emojiAnimal) 
          VALUES ('Perro', '🐶'), ('Gato', '🐱'), ('Pájaro', '🐦'), ('Caballos', '🐎') 
        ''');

        await db.execute('''
          INSERT INTO curiosidades (curiosidad, idAnimal, estadoCuriosidad) 
          VALUES 
            ('Los perros son leales compañeros', 1, 1), 
            ('Los gatos pueden dormir hasta 16 horas al día', 2, 1), 
            ('Los pájaros pueden imitar sonidos', 3, 1)
        ''');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Example'),
      ),
      body: Center(
        child: Text('Database initialized!'),
      ),
    );
  }
}

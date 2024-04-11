import 'dart:math';
import 'package:flutter/material.dart';
import 'package:curiosidadesanimalesmovil2/data/database.dart';
import 'package:curiosidadesanimalesmovil2/ui/components/curiosity_card.dart';
import 'package:sqflite/sqflite.dart';

class NuevaCuriosidadScreen extends StatefulWidget {
  const NuevaCuriosidadScreen({Key? key}) : super(key: key);

  @override
  _NuevaCuriosidadScreenState createState() => _NuevaCuriosidadScreenState();
}

class _NuevaCuriosidadScreenState extends State<NuevaCuriosidadScreen> {
  String? _selectedAnimal;
  List<String> _animalList = [];
  bool _showCuriosityCard = false;
  Map<String, dynamic>? _selectedCuriosity;
  List<Map<String, dynamic>> _allCuriosities = [];

  @override
  void initState() {
    super.initState();
    _loadAnimalList();
  }

  Future<void> _loadAnimalList() async {
    List<Map<String, dynamic>> animals = await DatabaseController.instance.queryAllAnimals();
    setState(() {
      _animalList = animals.map((animal) => animal['nombreAnimal'] as String).toList();
    });
  }

  Future<void> _loadRandomCuriosity() async {
    setState(() {
      _selectedAnimal = null;
    });

    _allCuriosities.clear();

    for (String animal in _animalList) {
      List<Map<String, dynamic>> curiosities = await _getCuriositiesForSelectedRandomAnimal(animal);
      _allCuriosities.addAll(curiosities);
    }
    
    if (_allCuriosities.isNotEmpty) {
      Random random = Random();
      int index = random.nextInt(_allCuriosities.length);
      setState(() {
        _selectedCuriosity = _allCuriosities[index];
        _showCuriosityCard = true;
      });
      await _updateCuriosityState();
    }
  }

  Future<List<Map<String, dynamic>>> _getCuriositiesForSelectedRandomAnimal(String animal) async {
    Database db = await DatabaseController.instance.database;
    return await db.rawQuery('''
      SELECT c.curiosidad, a.nombreAnimal, a.emojiAnimal 
      FROM curiosidades c 
      INNER JOIN animales a ON a.idAnimal = c.idAnimal 
      WHERE c.idAnimal = ?
    ''', [_animalList.indexOf(animal) + 1]);
  }

  Future<void> _loadSelectCuriosity() async {
    if (_selectedAnimal != null) {
      List<Map<String, dynamic>> curiosities = await _getCuriositiesForSelectedAnimal();
      if (curiosities.isNotEmpty) {
        Random random = Random();
        int index = random.nextInt(curiosities.length);
        setState(() {
          _selectedCuriosity = curiosities[index];
          _showCuriosityCard = true;
        });
        await _updateCuriosityState();
      }
    }
  }

  Future<List<Map<String, dynamic>>> _getCuriositiesForSelectedAnimal() async {
    Database db = await DatabaseController.instance.database;
    return await db.rawQuery('''
      SELECT c.curiosidad, a.nombreAnimal, a.emojiAnimal 
      FROM curiosidades c 
      INNER JOIN animales a ON a.idAnimal = c.idAnimal 
      WHERE c.idAnimal = ?
    ''', [_animalList.indexOf(_selectedAnimal!) + 1]);
  }

  Future<void> _updateCuriosityState() async {
    if (_selectedAnimal != null && _selectedCuriosity != null) {
      Database db = await DatabaseController.instance.database;
      await db.update(
        'curiosidades',
        {'estadoCuriosidad': 1},
        where: 'curiosidad = ?',
        whereArgs: [_selectedCuriosity!['curiosidad']],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Selecciona un animal',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.shuffle),
                  onPressed: _loadRandomCuriosity,
                ),
                DropdownButton<String>(
                  items: _animalList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedAnimal = value;
                    });
                  },
                  hint: const Text('Selecciona un animal'),
                  value: _selectedAnimal,
                ),
                ElevatedButton(
                  onPressed: _loadSelectCuriosity,
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
          if (_showCuriosityCard && _selectedCuriosity != null)
            CuriosityCard(
              animalName: _selectedCuriosity!['nombreAnimal'] ?? '',
              emoji: _selectedCuriosity!['emojiAnimal'] ?? '',
              curiosity: _selectedCuriosity!['curiosidad'] ?? '',
              onClose: () {
                setState(() {
                  _showCuriosityCard = false;
                });
              }, 
            ),
        ],
      ),
    );
  }
}

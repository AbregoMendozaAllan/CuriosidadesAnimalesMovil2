import 'dart:math';

import 'package:curiosidadesanimalesmovil2/ui/components/curiosity_card.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../data/database_controller.dart';

class NuevaCuriosidadScreen extends StatefulWidget {
  final String userId; 

  const NuevaCuriosidadScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _NuevaCuriosidadScreenState createState() => _NuevaCuriosidadScreenState();
}

class _NuevaCuriosidadScreenState extends State<NuevaCuriosidadScreen> {
  String? _selectedAnimal;
  List<String> _animalList = [];
  bool _showCuriosityCard = false;
  Map<String, dynamic>? _selectedCuriosity;
  List<Map<String, dynamic>> _allCuriosities = [];
  late bool _isFavorite = false; 
  TextEditingController _textFieldController = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    _loadAnimalList();
  }

  Future<void> _loadAnimalList() async {
    List<Map<String, dynamic>> animals = await DatabaseController.instance.getAllAnimals();
    setState(() {
      _animalList = animals.map((animal) => animal['animalName'] as String).toList();
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
      _isFavorite = false;
      _textFieldController.clear();  
    });
    await _updateCuriosityState();
    await _insertHistory();
  }
}

  Future<List<Map<String, dynamic>>> _getCuriositiesForSelectedRandomAnimal(String animal) async {
    Database db = await DatabaseController.instance.database;
    return await db.rawQuery('''
      SELECT c.curiosityID, c.funFact, a.animalName, a.animalEmoji 
      FROM funfacts c 
      INNER JOIN animals a ON a.animalID = c.animalID 
      WHERE c.animalID = ?
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
          _isFavorite = false; 
          _textFieldController.clear(); 
        });
        await _updateCuriosityState();
        await _insertHistory();
      }
    }
  }

  Future<List<Map<String, dynamic>>> _getCuriositiesForSelectedAnimal() async {
    Database db = await DatabaseController.instance.database;
    return await db.rawQuery('''
      SELECT c.curiosityID, c.funFact, a.animalName, a.animalEmoji 
      FROM funfacts c 
      INNER JOIN animals a ON a.animalID = c.animalID 
      WHERE c.animalID = ?
    ''', [_animalList.indexOf(_selectedAnimal!) + 1]);
  }

  Future<void> _updateCuriosityState() async {
    if (_selectedAnimal != null && _selectedCuriosity != null) {
      Database db = await DatabaseController.instance.database;
      await db.update(
        'funfacts',
        {'state': 1},
        where: 'funFact = ?',
        whereArgs: [_selectedCuriosity!['funFact']],
      );
    }
  }

  Future<void> _insertHistory() async {
    if (_selectedAnimal != null && _selectedCuriosity != null) {
      String userId = widget.userId; 
      String currentDate = DateTime.now().toIso8601String(); 
      Database db = await DatabaseController.instance.database;
      await db.insert(
        'history',
        {
          'curiosityID': _selectedCuriosity!['curiosityID'],
          'userID': userId,
          'dateAdded': currentDate,
        },
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
              userId: widget.userId,
              selectedCuriosity: _selectedCuriosity,
              animalName: _selectedCuriosity!['animalName'] ?? '',
              emoji: _selectedCuriosity!['animalEmoji'] ?? '',
              curiosity: _selectedCuriosity!['funFact'] ?? '',
              onClose: () {
                setState(() {
                  _showCuriosityCard = false;
                });
              }, 
            ),

          if (_isFavorite)
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  labelText: 'Añade una nota (opcional)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

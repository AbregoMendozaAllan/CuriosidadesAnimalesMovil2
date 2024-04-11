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
  String? _selectedCuriosity;

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
  List<Map<String, dynamic>> allCuriosities = [];
  for (String animal in _animalList) {
    List<Map<String, dynamic>> curiosities = await _getCuriositiesForSelectedRamdonAnimal(animal);
    allCuriosities.addAll(curiosities);
  }
  
  if (allCuriosities.isNotEmpty) {
    Random random = Random();
    int index = random.nextInt(allCuriosities.length);
    setState(() {
      _selectedCuriosity = allCuriosities[index]['curiosidad'];
      _showCuriosityCard = true;
    });
    await _updateCuriosityState(); // Llama al método para actualizar el estado de la curiosidad
  }
}

Future<List<Map<String, dynamic>>> _getCuriositiesForSelectedRamdonAnimal(String animal) async {
  Database db = await DatabaseController.instance.database;
  return await db.query('curiosidades',
      where: 'idAnimal = ?',
      whereArgs: [_animalList.indexOf(animal) + 1]);
}


  Future<void> _loadRandomSelectCuriosity() async {
    if (_selectedAnimal != null) {
      List<Map<String, dynamic>> curiosities = await _getCuriositiesForSelectedAnimal();
      if (curiosities.isNotEmpty) {
        Random random = Random();
        int index = random.nextInt(curiosities.length);
        setState(() {
          _selectedCuriosity = curiosities[index]['curiosidad'];
          _showCuriosityCard = true;
        });
        await _updateCuriosityState(); // Llama al método para actualizar el estado de la curiosidad
      }
    }
  }

  Future<List<Map<String, dynamic>>> _getCuriositiesForSelectedAnimal() async {
    Database db = await DatabaseController.instance.database;
    return await db.query('curiosidades',
        where: 'idAnimal = ?',
        whereArgs: [_animalList.indexOf(_selectedAnimal!) + 1]);
  }
  Future<void> _updateCuriosityState() async {
  if (_selectedAnimal != null && _selectedCuriosity != null) {
    Database db = await DatabaseController.instance.database;
    await db.update(
      'curiosidades',
      {'estadoCuriosidad': 1},
      where: 'curiosidad = ?',
      whereArgs: [_selectedCuriosity],
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
                  onPressed: _loadRandomSelectCuriosity,
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
          if (_showCuriosityCard)
  CuriosityCard(
    animalName: '', emoji: '',
    curiosity: _selectedCuriosity ?? '', // Pasa la curiosidad seleccionada al componente CuriosityCard
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

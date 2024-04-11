import 'dart:math';
import 'package:flutter/material.dart';
import 'package:curiosidadesanimalesmovil2/data/db.dart'; // Import the file where DatabaseController is defined
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
      _animalList = animals.map((animal) => animal['animalName'] as String).toList();
    });
  }

  Future<void> _loadRandomCuriosity() async {
    // Clear the selected animal
    setState(() {
      _selectedAnimal = null;
    });

    // Fetch all animals
    List<Map<String, dynamic>> animals = await DatabaseController.instance.queryAllAnimals();

    // Select a random animal
    Random random = Random();
    int animalIndex = random.nextInt(animals.length);
    String randomAnimal = animals[animalIndex]['animalName'] as String;

    // Fetch curiosities for the selected random animal
    List<Map<String, dynamic>> curiosities = await _getCuriositiesForSelectedRandomAnimal(randomAnimal);
    List<Map<String, dynamic>> filteredCuriosities = [];

    // Filter out curiosities that are already favorites for the user
    for (var curiosity in curiosities) {
      bool isFavorite = await DatabaseController.instance.checkIfCuriosityIsFavorite(curiosity['curiosityID'], 'admin');
      if (!isFavorite) {
        filteredCuriosities.add(curiosity);
      }
    }

    if (filteredCuriosities.isNotEmpty) {
      // Select a random curiosity from the filtered list
      int index = random.nextInt(filteredCuriosities.length);
      Map<String, dynamic> selectedCuriosity = filteredCuriosities[index];

      setState(() {
        _selectedCuriosity = selectedCuriosity['curiosity'];
        _showCuriosityCard = true;
      });

      await _updateCuriosityState(); // Call the method to update the curiosity state
    } else {
      // If all curiosities are favorites, show a message or handle it accordingly
      return;
    }
  }

  Future<List<Map<String, dynamic>>> _getCuriositiesForSelectedRandomAnimal(String animal) async {
    Database db = await DatabaseController.instance.database;
    return await db.query('Curiosity',
        where: 'animalID = ?',
        whereArgs: [_animalList.indexOf(animal) + 1]);
  }

  Future<void> _updateCuriosityState() async {
    if (_selectedAnimal != null && _selectedCuriosity != null) {
      // Update the state of the selected curiosity
    }
  }

  // newcode here

  Future<void> _loadCuriosityForSelectedAnimal() async {
    if (_selectedAnimal == null) {
      return; // If no animal is selected, return
    }

    // Fetch curiosities for the selected animal
    List<Map<String, dynamic>> curiosities = await _getCuriositiesForSelectedAnimal(_selectedAnimal!);
    List<Map<String, dynamic>> filteredCuriosities = [];

    // Filter out curiosities that are already favorites for the user
    for (var curiosity in curiosities) {
      bool isFavorite = await DatabaseController.instance.checkIfCuriosityIsFavorite(curiosity['curiosityID'], 'admin');
      if (!isFavorite) {
        filteredCuriosities.add(curiosity);
      }
    }

    if (filteredCuriosities.isNotEmpty) {
      // Select a random curiosity from the filtered list
      Random random = Random();
      int index = random.nextInt(filteredCuriosities.length);
      Map<String, dynamic> selectedCuriosity = filteredCuriosities[index];

      setState(() {
        _selectedCuriosity = selectedCuriosity['curiosity'];
        _showCuriosityCard = true;
      });

      await _updateCuriosityState(); // Call the method to update the curiosity state
    } else {
      // If all curiosities are favorites, show a message or handle it accordingly
      return;
    }
  }

  Future<List<Map<String, dynamic>>> _getCuriositiesForSelectedAnimal(String animal) async {
    Database db = await DatabaseController.instance.database;
    return await db.query('Curiosity',
        where: 'animalID = ?',
        whereArgs: [_animalList.indexOf(animal) + 1]);
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
                DropdownButton<String>(
                  value: _selectedAnimal,
                  items: _animalList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedAnimal = newValue;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: _loadCuriosityForSelectedAnimal,
                  child: Text('Enviar'),
                ),
                IconButton(
                  icon: Icon(Icons.shuffle),
                  onPressed: _loadRandomCuriosity,
                ),
              ],
            ),
          ),
          if (_showCuriosityCard)
            CuriosityCard(
              animalName: '', emoji: '',
              curiosity: _selectedCuriosity ?? '', // Pass the selected curiosity to the CuriosityCard component
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

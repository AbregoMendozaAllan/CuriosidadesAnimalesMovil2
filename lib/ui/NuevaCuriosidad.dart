// NuevaCuriosidadScreen.dart
import 'package:flutter/material.dart';
import '../data/database_controller.dart';
import 'components/curiosidad_favorita.dart';

class NuevaCuriosidadScreen extends StatefulWidget {
  final String userId; // Add userId property

  const NuevaCuriosidadScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _NuevaCuriosidadScreenState createState() => _NuevaCuriosidadScreenState();
}

class _NuevaCuriosidadScreenState extends State<NuevaCuriosidadScreen> {
  String? _selectedAnimal; // Added to track selected animal
  List<Map<String, dynamic>> _animals = []; // Initialize list to hold animals data
  late DatabaseController _dbController; // DatabaseController instance
  late Map<String, dynamic> _randomFunFact = {}; // Store random fun fact

  @override
  void initState() {
    super.initState();
    _dbController = DatabaseController.instance;
    _fetchAnimals(); // Fetch animals data from the database
  }

  Future<void> _fetchAnimals() async {
    final animals = await _dbController.getAllAnimals(); // Retrieve animals from the database
    setState(() {
      _animals = animals; // Update the list of animals
    });
  }

  Future<void> _fetchRandomFunFact() async {
    final randomFact = await _dbController.getRandomFunFact(); // Fetch random fun fact
    setState(() {
      _randomFunFact = randomFact ?? {}; // Store random fun fact
      _selectedAnimal = null; // Reset selected animal to null
    });
  }

  Future<void> _fetchFunFactForSelectedAnimal() async {
    if (_selectedAnimal != null) {
      final animal = _animals.firstWhere((element) => element['animalName'] == _selectedAnimal);
      final randomFact = await _dbController.getFunFactForAnimal(animal['animalID']);
      setState(() {
        _randomFunFact = randomFact ?? {};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    onPressed: () {
                      _fetchRandomFunFact();
                      setState(() {
                        _selectedAnimal = null;
                      });
                    }, // Fetch random fun fact when shuffle button is pressed
                  ),
                  DropdownButton<String>(
                    items: _animals.map((animal) {
                      return DropdownMenuItem<String>(
                        value: animal['animalName'].toString(),
                        child: Text(animal['animalName'].toString()),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedAnimal = value; // Update selected animal when dropdown changes
                      });
                    },
                    hint: const Text('Selecciona un animal'),
                    value: _selectedAnimal,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedAnimal != null) {
                        _fetchFunFactForSelectedAnimal(); // Fetch fun fact for the selected animal
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                ],
              ),
            ),
            if (_randomFunFact.isNotEmpty)
              CuriosidadFavorita(
                animalName: _randomFunFact['animalName'] ?? '',
                curiosity: _randomFunFact['funFact'] ?? '', // Use fetched curiosity text
                emoji: _randomFunFact['animalEmoji'] ?? '', // Use fetched curiosity emoji
                isFavorite: false,
                curiosityId: 1, // Dummy curiosity ID for demonstration
                userId: widget.userId, // Pass userId to CuriosidadFavorita
                onFavoriteChanged: (bool isFavorite) {},
              ),
          ],
        ),
      ),
    );
  }
}

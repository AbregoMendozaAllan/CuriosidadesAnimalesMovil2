import 'package:flutter/material.dart';
import '../data/database_controller.dart';

class AnimalesFavoritosScreen extends StatefulWidget {
  final String userId;

  const AnimalesFavoritosScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _AnimalesFavoritosScreenState createState() => _AnimalesFavoritosScreenState();
}

class _AnimalesFavoritosScreenState extends State<AnimalesFavoritosScreen> {
  late List<Map<String, dynamic>> _favoriteAnimals;
  late List<Map<String, dynamic>> _allAnimals;
  late DatabaseController _dbController;

  @override
  void initState() {
    super.initState();
    _favoriteAnimals = [];
    _allAnimals = [];
    _dbController = DatabaseController.instance;
    _fetchFavoriteAnimals();
    _fetchAllAnimals();
  }

  Future<void> _fetchFavoriteAnimals() async {
    final favoriteAnimals = await _dbController.getFavoriteAnimalsForUser(widget.userId);
    setState(() {
      _favoriteAnimals = favoriteAnimals;
    });
  }

  Future<void> _fetchAllAnimals() async {
    final allAnimals = await _dbController.getAllAnimals();
    setState(() {
      _allAnimals = allAnimals;
    });
  }

  void _toggleFavoriteAnimal(int animalID, bool newValue) {
    setState(() {
      if (newValue) {
        _favoriteAnimals = [..._favoriteAnimals, _allAnimals.firstWhere((animal) => animal['animalID'] == animalID)];
      } else {
        _favoriteAnimals = _favoriteAnimals.where((favAnimal) => favAnimal['animalID'] != animalID).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Favorite Animals"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _allAnimals.length,
              itemBuilder: (context, index) {
                final animal = _allAnimals[index];
                final isChecked = _favoriteAnimals.any((favAnimal) => favAnimal['animalID'] == animal['animalID']);
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Row(
                    children: [
                      Text(animal['animalEmoji'] + ' '), // Display the animal emoji
                      Text(animal['animalName']),
                    ],
                  ),
                  value: isChecked,
                  onChanged: (bool? value) {
                    if (value != null) {
                      _toggleFavoriteAnimal(animal['animalID'], value);
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20), // Add bottom margin
            child: ElevatedButton(
              onPressed: () async {
                List<int> favoriteAnimalIDs = [];
                for (var animal in _allAnimals) {
                  bool isChecked = _favoriteAnimals.any((favAnimal) => favAnimal['animalID'] == animal['animalID']);
                  if (isChecked) {
                    favoriteAnimalIDs.add(animal['animalID']);
                  }
                }

                try {
                  await _dbController.updateFavoriteAnimals(widget.userId, favoriteAnimalIDs);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Favorite animals updated successfully!'),
                    ),
                  );
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                } catch (e) {
                  print('Error updating favorite animals: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to update favorite animals.'),
                    ),
                  );
                }
              },
              child: const Text('Confirmar'),
            ),
          ),
        ],
      ),
    );
  }
}

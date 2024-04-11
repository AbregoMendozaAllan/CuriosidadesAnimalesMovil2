import 'package:curiosidadesanimalesmovil2/data/database.dart';
import 'package:curiosidadesanimalesmovil2/ui/components/curiosity_card.dart';
import 'package:flutter/material.dart';
import '../ui/components/bottom_navigation_bar.dart';
import '../ui/components/curiosity_card.dart'; // Importa el archivo curiosity_card.dart

class NuevaCuriosidadScreen extends StatefulWidget {
  const NuevaCuriosidadScreen({Key? key}) : super(key: key);

  @override
  _NuevaCuriosidadScreenState createState() =>
      _NuevaCuriosidadScreenState();
}

class _NuevaCuriosidadScreenState extends State<NuevaCuriosidadScreen> {
  String? _selectedAnimal;
  List<String> _animalList = [];
  bool _showCuriosityCard = false;

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
                  onPressed: () {
                    _showCuriosityCard = true;
                    setState(() {});
                  },
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
                  onPressed: () {
                    if (_selectedAnimal != null) {
                      _showCuriosityCard = true;
                      setState(() {});
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
          if (_showCuriosityCard)
            CuriosityCard(
              onClose: () {
                _showCuriosityCard = false;
                setState(() {});
              },
            ),
        ],
      ),
    );
  }
}

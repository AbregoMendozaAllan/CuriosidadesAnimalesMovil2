import 'package:flutter/material.dart';

class AnimalesFavoritosScreen extends StatefulWidget {
  const AnimalesFavoritosScreen({Key? key}) : super(key: key);

  @override
  _AnimalesFavoritosScreenState createState() => _AnimalesFavoritosScreenState();
}

class _AnimalesFavoritosScreenState extends State<AnimalesFavoritosScreen> {
  final List<String> _animalesSeleccionados = [];
  final List<String> _listaAnimales = [
    'Perro', 'Gato', 'Pájaro', 'León', 'Tigre', 'Elefante', 'Oso', 'Cebra', 'Jirafa',
    'Zorro', 'Canguro', 'Delfín', 'Ballena', 'Hipopótamo', 'Mono', 'Cocodrilo', 'Tortuga', 'Pez',
    'Panda', 'Aguila', 'Pavo real', 'Conejo', 'Koala', 'Suricata', 'Rinoceronte', 'Zebra', 'Lobo',
    'Nutria', 'Mapache', 'Castor', 'Camello', 'Foca', 'Pulpo', 'Calamar', 'Pinguino', 'Pingüino',
    'Avestruz', 'Cebra', 'Coyote', 'Chita', 'Guepardo', 'Iguana', 'Búho', 'Aguila', 'Caracol',
    'Rana', 'Serpiente', 'Erizo', 'Cabra', 'Ornitorrinco', 'Suricata', 'Puma', 'Papagayo', 'Ratón',
  ];

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
              itemCount: _listaAnimales.length,
              itemBuilder: (context, index) {
                final animal = _listaAnimales[index];
                final isChecked = _animalesSeleccionados.contains(animal);
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(animal),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _animalesSeleccionados.add(animal);
                      } else {
                        _animalesSeleccionados.remove(animal);
                      }
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Close the modal and pass back the selected animals
              Navigator.pop(context, _animalesSeleccionados);
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../data/database_controller.dart';

class FunFactCard extends StatefulWidget {
  final Map<String, dynamic>? funFactData; // Make funFactData nullable
  final Function onClose;

  const FunFactCard({Key? key, this.funFactData, required this.onClose}) : super(key: key);

  @override
  _FunFactCardState createState() => _FunFactCardState();
}

class _FunFactCardState extends State<FunFactCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    if (widget.funFactData == null) { // Check if funFactData is null
      return Container(); // Return an empty container or handle null case appropriately
    }

    // If funFactData is not null, continue building the widget
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    widget.onClose(); // Call the onClose callback to close the card
                  },
                  icon: Icon(Icons.close),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite; // Toggle the favorite status
                    });
                  },
                  icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: isFavorite ? Colors.amber : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              widget.funFactData!['curiosity'], // Display the fun fact
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            FutureBuilder<Map<String, dynamic>>(
              future: getAnimalData(widget.funFactData!['animalID']), // Use ! to access non-null funFactData
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!['animalEmoji'], // Display the emoji
                    style: TextStyle(fontSize: 24.0),
                  );
                } else {
                  return CircularProgressIndicator(); // Show loading indicator while fetching data
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to get animal data from the database controller
  Future<Map<String, dynamic>> getAnimalData(int animalID) async {
    final db = await DatabaseController.instance.database;
    final result = await db.query(
      'animals',
      where: 'animalID = ?',
      whereArgs: [animalID],
    );
    return result.first;
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/curiosity_card_logic.dart';
import '../main.dart';
import 'components/curiosity_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserIDProvider>(
      builder: (context, userIDProvider, _) {
        return FutureBuilder<Map<String, dynamic>>(
          future: CuriosityController.getRandomCuriosityForUser(userIDProvider.userID!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show a loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No favorite animals found for the user');
            } else {
              final curiosityData = snapshot.data!;
              return Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome, User!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            CuriosityCard(
                              onClose: () {}, // Add onClose functionality if needed
                              animalName: curiosityData['animalName'],
                              emoji: curiosityData['animalEmoji'],
                              curiosity: curiosityData['curiosity'],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, bottom: 10.0),
                        child: Text(
                          'Historial',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Add other CuriosityCards here if needed
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}

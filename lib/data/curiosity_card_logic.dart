import 'package:curiosidadesanimalesmovil2/data/db.dart';
import 'dart:math';

class CuriosityController {
  static Future<Map<String, dynamic>> getRandomCuriosityForUser(String userID) async {
    DatabaseController dbController = DatabaseController.instance;
    List<Map<String, dynamic>> favoriteAnimals = await dbController.queryFavoriteAnimals(userID);

    if (favoriteAnimals.isEmpty) {
      // No favorite animals found for the user
      return {};
    }

    // Select a random favorite animal
    Random random = Random();
    int randomIndex = random.nextInt(favoriteAnimals.length);
    Map<String, dynamic> selectedAnimal = favoriteAnimals[randomIndex];

    // Get curiosities for the selected animal
    List<Map<String, dynamic>> curiosities = await dbController.queryCuriositiesByAnimalID(selectedAnimal['animalID']);

    if (curiosities.isEmpty) {
      // No curiosities found for the selected animal
      return {};
    }

    // Filter out curiosities that are already favorites for the user
    List<Map<String, dynamic>> filteredCuriosities = [];
    for (var curiosity in curiosities) {
      bool isFavorite = await dbController.checkIfCuriosityIsFavorite(curiosity['curiosityID'], userID);
      if (!isFavorite) {
        filteredCuriosities.add(curiosity);
      }
    }

    if (filteredCuriosities.isEmpty) {
      // All curiosities for the selected animal are already favorites
      return {};
    }

    // Select a random curiosity from the filtered list
    randomIndex = random.nextInt(filteredCuriosities.length);
    Map<String, dynamic> selectedCuriosity = filteredCuriosities[randomIndex];

    return selectedCuriosity;
  }
}

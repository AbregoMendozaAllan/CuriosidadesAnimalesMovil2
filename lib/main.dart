import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curiosidadesanimalesmovil2/ui/login.dart';
import 'package:curiosidadesanimalesmovil2/data/db.dart'; // Import the file where DatabaseController is defined

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserIDProvider(),
      child: MaterialApp(
        home: LoginPage(), // Assuming LoginPage is your initial screen
      ),
    );
  }
}

class UserIDProvider extends ChangeNotifier {
  String? userID; // User ID variable

  void setUserID(String id) {
    userID = id;
    notifyListeners(); // Notify listeners about changes
  }
}

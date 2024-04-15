import 'package:curiosidadesanimalesmovil2/ui/login.dart';
import 'package:flutter/material.dart';
import 'data/database_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseController.instance.database; 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), 
    );
  }
}

import 'package:curiosidadesanimalesmovil2/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print ('You have an error! ${snapshot.error.toString()}');
            return  Text('Something went wrong!');
            } else if (snapshot.hasData) {
              return LoginPage();
            } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      /*LoginPage()*/
    );
  }
}


import 'package:flutter/material.dart';
import '../data/database_controller.dart';
import 'main_screen.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _userIDController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _userIDController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userIDController,
              decoration: InputDecoration(
                labelText: 'Usuario',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final authenticatedUser = await authenticateUser(
                  _userIDController.text,
                  _passwordController.text,
                );

                if (authenticatedUser != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(userId: authenticatedUser['userID']),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Usuario o Contraseña Incorrecta.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 20),
            ElevatedButton( 
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> authenticateUser(String userID, String password) async {
    final db = await DatabaseController.instance.database;
    final result = await db.query(
      'user',
      where: 'userID = ? AND password = ?',
      whereArgs: [userID, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    _userIDController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

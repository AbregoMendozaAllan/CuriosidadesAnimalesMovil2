import 'package:flutter/material.dart';
import '../data/database_controller.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'Usuario',
              ),
            ),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                hintText: 'Nombre',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                hintText: 'Apellido',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Correo',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                hintText: 'Confirmar Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Check if passwords match
                if (_passwordController.text != _confirmPasswordController.text) {
                  _showErrorDialog('Las contraseñas no coinciden.');
                  return;
                }

                // Check if user ID already exists
                final existingUser = await DatabaseController.instance.authenticateUser(_usernameController.text, _passwordController.text);
                if (existingUser != null) {
                  _showErrorDialog('El usuario ya existe.');
                  return;
                }

                // Register user
                final registeredUser = await DatabaseController.instance.registerUser(
                  _usernameController.text,
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _passwordController.text,
                );

                if (registeredUser != null) {
                  // Show success dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Éxito'),
                      content: Text('Usuario registrado correctamente.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Navigate back to login screen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  _showErrorDialog('Hubo un error al registrar el usuario.');
                }
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

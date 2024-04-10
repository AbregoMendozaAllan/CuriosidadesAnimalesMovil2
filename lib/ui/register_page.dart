// En el archivo register_page.dart
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView( // Añadido para permitir desplazamiento si el contenido no cabe en la pantalla
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
              onPressed: () {
                // Aquí iría la lógica para registrar al usuario
                print('Registrando al usuario con los siguientes datos:');
                print('Usuario: ${_usernameController.text}');
                print('Nombre: ${_firstNameController.text}');
                print('Apellido: ${_lastNameController.text}');
                print('Correo: ${_emailController.text}');
                print('Contraseña: ${_passwordController.text}');
                // Aquí idealmente verificarías que las dos contraseñas coinciden antes de proceder
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
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

import 'package:curiosidadesanimalesmovil2/ui/register_page.dart';
import 'package:curiosidadesanimalesmovil2/ui/usuario_contrasena.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Recuperar Contraseña'),
        content: TextField(
          controller: _usernameController, // Reutilizar el controlador de nombre de usuario para el email
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Enviar'),
            onPressed: () {
              // Aquí iría la lógica para manejar la recuperación de la contraseña
              print('Solicitud de recuperación de contraseña para: ${_usernameController.text}');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'Usuario',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Contraseña',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Usuario: ${_usernameController.text}, Contraseña: ${_passwordController.text}');
              },
              child: const Text('Iniciar Sesión'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: const Text('Registrarse'),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UsuarioContrasenaPage()),
                );
              },
              child: Text('Olvidé mi contraseña'),
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
    super.dispose();
  }
}

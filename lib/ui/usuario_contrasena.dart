import 'package:flutter/material.dart';

class UsuarioContrasenaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verificar Usuario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Verificar Usuario y Cambio de Contraseña',
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center, // Añadido para centrar el texto
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Correo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Agrega aquí la lógica para verificar el usuario
              },
              child: Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}

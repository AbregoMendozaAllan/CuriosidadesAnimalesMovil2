import 'package:flutter/material.dart';
import 'cambio_contrasena.dart';
import '../data/database_controller.dart';
import 'login.dart';

class ConfiguracionScreen extends StatefulWidget {
  final String userId; 

  const ConfiguracionScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _ConfiguracionScreenState createState() => _ConfiguracionScreenState();
}

class _ConfiguracionScreenState extends State<ConfiguracionScreen> {
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late bool _isEditingName;
  late bool _isEditingLastName;
  late bool _isEditingEmail;
  bool _changesMade = false; 

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _isEditingName = false;
    _isEditingLastName = false;
    _isEditingEmail = false;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userData = await DatabaseController.instance.getUserData(widget.userId);
    if (userData != null) {
      setState(() {
        _nameController.text = userData['name'];
        _lastNameController.text = userData['lastName'];
        _emailController.text = userData['email'];
      });
    }
  }

  Future<void> _updateUserData() async {
    await DatabaseController.instance.updateUserData(
      widget.userId,
      _nameController.text,
      _lastNameController.text,
      _emailController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Datos actualizados correctamente'),
      ),
    );
    setState(() {
      _changesMade = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Configuración',
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              _buildEditableField('Nombre', _nameController, _isEditingName, () {
                setState(() {
                  _isEditingName = !_isEditingName;
                  _changesMade = true; 
                });
              }),
              const SizedBox(height: 10.0),
              _buildEditableField('Apellido', _lastNameController, _isEditingLastName, () {
                setState(() {
                  _isEditingLastName = !_isEditingLastName;
                  _changesMade = true; 
                });
              }),
              const SizedBox(height: 10.0),
              _buildEditableField('Correo', _emailController, _isEditingEmail, () {
                setState(() {
                  _isEditingEmail = !_isEditingEmail;
                  _changesMade = true; 
                });
              }),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _changesMade ? _updateUserData : null, 
                child: const Text('Confirmar Datos'),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CambioContrasenaPage(userId: widget.userId); 
                    },
                  );
                },
                child: const Text('Cambiar Contraseña'),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Cerrar Sesión'),
              ),
              const SizedBox(height: 200.0), 
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller, bool isEditing, VoidCallback onPressed) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
            readOnly: !isEditing,
          ),
        ),
        IconButton(
          icon: isEditing ? Icon(Icons.done) : Icon(Icons.edit),
          onPressed: onPressed,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

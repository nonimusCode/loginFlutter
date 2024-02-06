
import 'package:flutter/material.dart';

class UserDetailsFormPage extends StatefulWidget {
  const UserDetailsFormPage({Key? key}) : super(key: key);

  @override
  _UserDetailsFormPageState createState() => _UserDetailsFormPageState();
}

class _UserDetailsFormPageState extends State<UserDetailsFormPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveForm() {
    // Aquí implementarías la lógica para guardar la información
    // Por ejemplo, enviarla a una base de datos o a una API
    // Después de guardar, puedes mostrar un mensaje o cambiar de pantalla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Detalles'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView( // Usamos ListView para evitar problemas de desbordamiento
          children: [
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Teléfono',
                hintText: 'Ingrese su teléfono',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Dirección',
                hintText: 'Ingrese su dirección',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveForm,
              child: Text('Guardar'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 36), // ancho infinito, altura 36
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Ha iniciado sesión correctamente',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Definimos un StatefulWidget, lo cual es necesario para formularios
// ya que podríamos querer actualizar la UI basados en la entrada del usuario.
class RegistrationForm extends StatefulWidget {
  // El constructor const permite que el widget sea más eficiente en la reconstrucción.
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

// La clase State para RegistrationForm donde se manejará el estado del formulario.
class _RegistrationFormState extends State<RegistrationForm> {
  // GlobalKey que se usa para identificar nuestro formulario. Esto es útil para la validación.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Scaffold provee la estructura básica de la pantalla en la aplicación de Material Design.
    return Scaffold(
      // AppBar es la barra superior de la aplicación.
      appBar: AppBar(
        title: Text('Registro'), // Título en la barra de la aplicación.
      ),
      // Padding añade espacio alrededor de nuestro formulario.
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Relleno en todos los lados del formulario.
        // SingleChildScrollView evita el desbordamiento de la UI cuando aparece el teclado.
        child: SingleChildScrollView(
          // Form es un contenedor para agrupar y validar múltiples campos de formulario.
          child: Form(
            key: _formKey, // Asociamos la GlobalKey con nuestro formulario.
            // Column organiza sus hijos verticalmente.
            child: Column(
              mainAxisSize: MainAxisSize.min, // La columna ocupa el menor espacio posible en la pantalla.
              children: <Widget>[
                // Image.network carga una imagen de una URL dada.
                Image.network(
                  'https://tu_url_de_la_imagen.com/imagen.jpg', // URL de la imagen.
                  height: 200, // Altura fija para la imagen.
                ),
                // SizedBox proporciona espacio entre la imagen y el primer campo de texto.
                SizedBox(height: 20),
                // TextFormField es un campo de texto con validación incorporada.
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre', // Texto que describe el campo de texto.
                    border: OutlineInputBorder(), // Borde alrededor del campo de texto.
                  ),
                  // Función para validar la entrada.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre'; // Mensaje de error si el campo está vacío.
                    }
                    return null; // Si no hay error, retorna null.
                  },
                ),
                // Repetimos este patrón para cada campo del formulario.
                SizedBox(height: 10),
                TextFormField(
                  // ...
                ),
                // ...
                // ElevatedButton se utiliza para un botón con elevación que es prominente en la UI.
                ElevatedButton(
                  // onPressed define el callback que se llama cuando el botón es presionado.
                  onPressed: () {
                    // Llamamos al método validate del _formKey que verifica cada campo del formulario.
                    if (_formKey.currentState!.validate()) {
                      // Si el formulario es válido, podríamos enviar los datos a un servidor, por ejemplo.
                    }
                  },
                  child: Text('Comienza ahora'), // Texto dentro del botón.
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

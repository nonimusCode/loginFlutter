import 'package:flutter/material.dart';
import 'package:login/flutter_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/screans/form1_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
  class _LoginPageState extends State<LoginPage>{
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

     // Suponiendo que estas sean tus credenciales "correctas"
    final String _correctEmail = 'usuarioexample.com';
    final String _correctPassword = '123456';

  void _login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email == _correctEmail && password == _correctPassword) {
      // Mostrar SnackBar con mensaje de bienvenida
      /* ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bienvenido, $email')), 
      );*/
      Navigator.pushReplacement( // Esto reemplaza la pantalla actual por la nueva
      context,
      MaterialPageRoute(builder: (context) => UserDetailsFormPage()),
    );
    } else {
      // Mostrar error si las credenciales son incorrectas
      /* ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo electrónico o contraseña incorrectos')),
      ); */
       // Mostrar error si las credenciales son incorrectas
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Correo electrónico o contraseña incorrectos'),
      ),
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Transform.translate(
          offset: const Offset(0, 5),
          child: const Text('Login',
          textAlign: TextAlign.center,
          ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              'https://www.ciudaddemascotas.com/pub/media/wysiwyg/BlogImages/Julio2016/cosas-de-gatitos.jpg',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
             TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo Electrónico',
              ),
            ),
            const SizedBox(height: 10),
             TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Iniciar sesión'),
            ),
            ],
        ),
        ),
  );
  }
}
    
  
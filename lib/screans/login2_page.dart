import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/screans/products_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

 final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Suponiendo que estas sean tus credenciales "correctas"
  final String _correctEmail = 'user';
  final String _correctPassword = '123';

  void _login () async { 
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email == _correctEmail && password == _correctPassword) {
      // Mostrar SnackBar con mensaje de bienvenida
      /* ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bienvenido, $email')), 
      );*/
      //final token = true;
      SharedPreferences shared = await SharedPreferences.getInstance();
      shared.setString("login", jsonEncode({}));
      Navigator.pushReplacement(
        // Esto reemplaza la pantalla actual por la nueva
        context,
        MaterialPageRoute(builder: (context) => ProductListPage()),
      );
    } else {
      // Mostrar error si las credenciales son incorrectas
      /* ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correo electrónico o contraseña incorrectos')),
      ); */
      // Mostrar error si las credenciales son incorrectas
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Correo electrónico o contraseña incorrectos'),
        ),
      );
    }
  }




  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: Offset(0, 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network('https://github.com/images/modules/search/mona-love-2x.png',
              fit: BoxFit.cover,
              height: 20.0,
              ),
              SizedBox(width: 10),
              Text('Iniciar..')
            ],
          )
          ),
          
      ),
      
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sing in to your account',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
           SizedBox(height: 20),
           TextField(
            controller: _emailController,
            decoration: InputDecoration( 
              labelText: 'Email adress',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              )
            ),
           ),
           SizedBox(height: 10),
           TextField(
            controller: _passwordController,
            decoration: InputDecoration( 
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              )
            ),
           ),
           SizedBox(height: 10),
           ElevatedButton(
            onPressed: _login, 
            child: Text('Iniciar sesión',
            style: TextStyle(
              color: Colors.white
            ),
            ),
           style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // Color de fondo del botón
            foregroundColor: Colors.white, // Color del texto (usado si el texto es un Widget directamente en child)
            minimumSize: Size(double.infinity, 50), // Tamaño mínimo del botón, ancho infinito para que se expanda y altura 50
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Bordes redondeados del botón
          ),
         ), 
        ),
          ],
          

          ),
      ),
      
    );
  
  }
}
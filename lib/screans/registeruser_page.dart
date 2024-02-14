import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Usuario'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network('https://img.freepik.com/foto-gratis/hombre-joven-pelo-negro-que-demuestra-algo-computadora-portatil-brillante_231208-2322.jpg?w=996&t=st=1707663895~exp=1707664495~hmac=a73917bfe9796f46691cb2557beff101170a42f6ae6d70defd776fbb7390ae23',
                height: 200,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration:  InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                  //validar entrada
                  validator: (value) {
                    if (value== null || value.isEmpty) {
                      return 'Digita tu nombre..';
                    }

                    return null; //si no hay error retorna Null
                  },  
                 ), 
                    //Repetimos el patron TextFormField para cada campo del formulario
                    SizedBox(height: 10),
                    TextFormField(
                  decoration:  InputDecoration(
                    labelText: 'Correo electrónico personal',
                    border: OutlineInputBorder(),
                  ),
                  //validar entrada
                  validator: (value) {
                    if (value== null || value.isEmpty) {
                      return 'Digita tu e-mail..';
                    }

                    return null; //si no hay error retorna Null
                  },  
                 ), 
                  SizedBox(height: 80,),
                    //Repetimos el patron TextFormField para cada campo del formulario
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      
                    }
                  },
                  child: Text('Hora de comenzar..'),
                  ),
                 
              ],
            ),
           ),
          ),
        ),    
    );
  }
}
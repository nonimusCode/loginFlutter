import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/flutter_bloc/auth_bloc.dart';
import 'package:login/screans/login2_page.dart';
import 'package:login/screans/products_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //elimina la cinta del debug de la aplicacion
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<bool>(
          future: checkLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data == true) {
                return const ProductListPage();
              } else {
                return BlocProvider(
                  create: (context) => AuthBloc(),
                  child: const StartPage(),
                );
              }
            }
          },
        ));
  }

  Future<bool> checkLogin() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    //tenemos shared una instancia de todo nuestro SharedPreference
    return shared.getBool("login") ?? false;
  }
}

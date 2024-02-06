import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/flutter_bloc/auth_bloc.dart';
import 'package:login/screans/login_page.dart';
import 'package:login/screans/form1_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>AuthBloc(),
        child: const LoginPage(),
      ),
    );
  }
}
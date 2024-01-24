// auth_bloc.dart
import 'package:bloc/bloc.dart';

enum AuthEvent { login }

class AuthBloc extends Bloc<AuthEvent, bool> {
  AuthBloc()
      : super(
            false); // Invoca el constructor de la clase base con el estado inicial.

  @override
  Stream<bool> mapEventToState(AuthEvent event) async* {
    switch (event) {
      case AuthEvent.login:
        // Aquí deberías implementar la lógica de autenticación
        // y cambiar el estado a true si la autenticación es exitosa.
        yield true;
        break;
    }
  }
}

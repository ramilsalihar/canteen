part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  LoginWithEmailAndPassword({
    required this.email,
    required this.password,
  });
}

class CreateUserWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  CreateUserWithEmailAndPassword({
    required this.email,
    required this.password,
  });
}

class ShowLoginPage extends AuthEvent {}

class ShowSignupPage extends AuthEvent {}

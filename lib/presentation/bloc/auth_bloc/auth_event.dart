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

class SignupButtonPressed extends AuthEvent {
  final String email;
  final String password;
  final String phone;

  SignupButtonPressed({
    required this.email,
    required this.password,
    required this.phone,
  });
}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  LoginButtonPressed({
    required this.email,
    required this.password,
  });
}

class ShowLoginPage extends AuthEvent {}

class ShowSignupPage extends AuthEvent {}

part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

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

class AuthenticateUser extends AuthEvent {
  final String id;

  AuthenticateUser({required this.id});
}

class ShowLoginPage extends AuthEvent {}

class ShowSignupPage extends AuthEvent {}

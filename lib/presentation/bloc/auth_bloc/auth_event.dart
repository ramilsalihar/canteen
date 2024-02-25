part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignupButtonPressed extends AuthEvent {
  final String email;
  final String password;
  final String phone;
  final String role;

  SignupButtonPressed({
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
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

class LogoutButtonPressed extends AuthEvent {}

class ShowLoginPage extends AuthEvent {}

class ShowSignupPage extends AuthEvent {}

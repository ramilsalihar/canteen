part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccessState extends AuthState {
  final User user;

  AuthSuccessState({required this.user});
}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}

class LoginState extends AuthState {}

class SignupState extends AuthState {}

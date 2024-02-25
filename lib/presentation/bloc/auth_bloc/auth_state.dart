part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthUserSuccessState extends AuthState {
  final UserModel user;

  AuthUserSuccessState({required this.user});
}

class AuthAdminSuccessState extends AuthState {
  final AdminModel user;

  AuthAdminSuccessState({required this.user});
}

class AuthLogoutState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}

class AuthUserRolesState extends AuthState {
  final bool isAdmin;

  AuthUserRolesState({required this.isAdmin});
}

class LoginState extends AuthState {}

class SignupState extends AuthState {}

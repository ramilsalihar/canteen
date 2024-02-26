import 'package:bloc/bloc.dart';
import 'package:canteen/data/datasources/firebase_auth_data_source.dart';
import 'package:canteen/data/models/admin_model.dart';
import 'package:canteen/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required FirebaseAuthDataSource authService,
  })  : _authService = authService,
        super(AuthInitial()) {
    on<ShowLoginPage>((event, emit) {
      emit(LoginState());
    });
    on<ShowSignupPage>((event, emit) {
      emit(SignupState());
    });
    on<SignupButtonPressed>(handleSignupButtonPressed);
    on<LoginButtonPressed>(handleLoginButtonPressed);
    on<AuthenticateUser>(handleUserRoles);
    on<LogoutButtonPressed>(handleLogout);
  }

  final FirebaseAuthDataSource _authService;

  void handleSignupButtonPressed(
      SignupButtonPressed event, Emitter<AuthState> emit) async {
    emit(
      AuthLoading(),
    );
    try {
      UserModel user = await _authService.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
        phoneNumber: event.phone,
        role: event.role,
      );

      emit(
        AuthUserSuccessState(user: user),
      );
    } catch (e) {
      emit(
        AuthErrorState(message: e.toString()),
      );
    }
  }

  void handleLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      AuthLoading(),
    );
    try {
      final userCredential = await _authService.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (userCredential is AdminModel) {
        emit(
          AuthAdminSuccessState(user: userCredential),
        );
      } else if (userCredential is UserModel) {
        emit(
          AuthUserSuccessState(user: userCredential),
        );
      }
    } catch (e) {
      print('Error: $e');
      emit(
        AuthErrorState(message: e.toString()),
      );
    }
  }

  Future<void> handleUserRoles(
      AuthenticateUser event, Emitter<AuthState> emit) async {
    if (state is AuthUserSuccessState) {
      emit(
        AuthUserRolesState(isAdmin: false),
      );
    } else if (state is AuthAdminSuccessState) {
      emit(
        AuthUserRolesState(isAdmin: true),
      );
    }
  }

  bool get isAdmin => state is AuthAdminSuccessState;

  Future<void> handleLogout(
    LogoutButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authService.logout();
      emit(
        AuthLogoutState(),
      );
    } catch (e) {
      emit(
        AuthErrorState(
          message: e.toString(),
        ),
      );
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:canteen/data/datasources/firebase_auth_data_source.dart';
import 'package:canteen/data/models/admin_model.dart';
import 'package:canteen/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
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
      // Registering a new user
      final _firebaseAuth = FirebaseAuth.instance;
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      // Store additional information in Firebase Realtime Database
      final name = event.email.split('.').first;
      final surname =
          event.email.split('@').first.split('.').last.split('_').first;
      ;
      final phone = event.phone;
      final classYear = event.email.split('@').first.split('_').last;
      const balance = 0.0;

      final firebaseData = GetIt.instance.get<FirebaseDatabase>().ref("users/");
      await firebaseData
          .push()
          // .ref()
          // .child('users/${userCredential.user!.uid}')
          .set({
        "email": event.email,
        "phone": event.phone,
        "classYear": "2020",
      });

      emit(
        AuthUserSuccessState(user: userCredential),
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

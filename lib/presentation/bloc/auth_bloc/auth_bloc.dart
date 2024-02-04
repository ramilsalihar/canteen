// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:canteen/data/datasources/firebase_auth_data_source.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required FirebaseAuthDataSource authService,
  })  : _authService = authService,
        super(AuthInitial()) {
    on<LoginWithEmailAndPassword>(_mapSignInWithEmailAndPassword);
    on<CreateUserWithEmailAndPassword>(_mapCreateUserWithEmailAndPassword);
    on<ShowLoginPage>((event, emit) {
      emit(LoginState());
    });
    on<ShowSignupPage>((event, emit) {
      emit(SignupState());
    });
  }

  final FirebaseAuthDataSource _authService;

  Future<void> _mapSignInWithEmailAndPassword(
    LoginWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(
        AuthSuccessState(),
      );
    } catch (e) {
      emit(
        AuthErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> _mapCreateUserWithEmailAndPassword(
    CreateUserWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authService.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(
        AuthSuccessState(),
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

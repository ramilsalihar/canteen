import 'package:bloc/bloc.dart';
import 'package:canteen/data/datasources/firebase_auth_data_source.dart';
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
    on<LoginWithEmailAndPassword>(_mapSignInWithEmailAndPassword);
    on<CreateUserWithEmailAndPassword>(_mapCreateUserWithEmailAndPassword);
    on<ShowLoginPage>((event, emit) {
      emit(LoginState());
    });
    on<ShowSignupPage>((event, emit) {
      emit(SignupState());
    });
    on<SignupButtonPressed>(handleSignupButtonPressed);
    on<LoginButtonPressed>(handleLoginButtonPressed);
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
        AuthSuccessState(
          user: FirebaseAuth.instance.currentUser!,
        ),
      );
    } catch (e) {
      emit(
        AuthErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  void handleSignupButtonPressed(
      SignupButtonPressed event, Emitter<AuthState> emit) async {
    emit(
      AuthLoading(),
    );
    try {
      // Registering a new user
      final firebaseAuth = FirebaseAuth.instance;
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
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

      print('name: $name, surname: $surname');
      print('phone: $phone');
      print('classYear: $classYear');
      print('balance: $balance');

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
        AuthSuccessState(user: userCredential.user!),
      );
    } catch (e) {
      emit(
        AuthErrorState(message: e.toString()),
      );
    }
  }

  void handleLoginButtonPressed(
      LoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(
      AuthLoading(),
    );
    try {
      final firebaseAuth = FirebaseAuth.instance;
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(
        AuthSuccessState(user: userCredential.user!),
      );
    } catch (e) {
      emit(
        AuthErrorState(message: e.toString()),
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
        AuthSuccessState(
          user: FirebaseAuth.instance.currentUser!,
        ),
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

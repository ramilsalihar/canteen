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
    // on<SignupButtonPressed>(handleSignupButtonPressed);
    on<LoginButtonPressed>(handleLoginButtonPressed);
    // on<AuthenticateUser>(handleUserRoles);
  }

  final FirebaseAuthDataSource _authService;

  // void handleSignupButtonPressed(
  //     SignupButtonPressed event, Emitter<AuthState> emit) async {
  //   emit(
  //     AuthLoading(),
  //   );
  //   try {
  //     // Registering a new user
  //     final _firebaseAuth = FirebaseAuth.instance;
  //     UserCredential userCredential =
  //         await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: event.email,
  //       password: event.password,
  //     );
  //
  //     // Store additional information in Firebase Realtime Database
  //     final name = event.email.split('.').first;
  //     final surname =
  //         event.email.split('@').first.split('.').last.split('_').first;
  //     ;
  //     final phone = event.phone;
  //     final classYear = event.email.split('@').first.split('_').last;
  //     const balance = 0.0;
  //
  //     print('name: $name, surname: $surname');
  //     print('phone: $phone');
  //     print('classYear: $classYear');
  //     print('balance: $balance');
  //
  //     final firebaseData = GetIt.instance.get<FirebaseDatabase>().ref("users/");
  //     await firebaseData
  //         .push()
  //         // .ref()
  //         // .child('users/${userCredential.user!.uid}')
  //         .set({
  //       "email": event.email,
  //       "phone": event.phone,
  //       "classYear": "2020",
  //     });
  //
  //     emit(
  //       AuthUserSuccessState(user: userCredential),
  //     );
  //   } catch (e) {
  //     emit(
  //       AuthErrorState(message: e.toString()),
  //     );
  //   }
  // }

  void handleLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      AuthLoading(),
    );
    try {
      print('event.email: ${event.email}');
      final userCredential = await _authService.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      print('userCredential: ${userCredential.runtimeType}');

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
      emit(
        AuthErrorState(message: e.toString()),
      );
    }
  }

  // Future<void> handleUserRoles(
  //     AuthenticateUser event, Emitter<AuthState> emit) async {
  //   final usersCollection = FirebaseFirestore.instance.collection('users');
  //   final adminsCollection = FirebaseFirestore.instance.collection('admins');
  //   final userDoc =
  //       await usersCollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
  //   if (userDoc.exists) {
  //     emit(
  //       AuthUserSuccessState(user: FirebaseAuth.instance.currentUser!),
  //     );
  //   } else {
  //     final adminDoc = await adminsCollection
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     if (adminDoc.exists) {
  //       emit(
  //         AuthAdminSuccessState(user: FirebaseAuth.instance.currentUser!),
  //       );
  //     } else {
  //       emit(
  //         AuthErrorState(message: 'User does not exist in either collection'),
  //       );
  //     }
  //   }
  // }
}

import 'package:canteen/core/error/auth_error.dart';
import 'package:canteen/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class FirebaseAuthService {
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  FirebaseAuthServiceImpl({
    required auth.FirebaseAuth authService,
  }) : _firebaseAuth = authService;

  final auth.FirebaseAuth _firebaseAuth;

  //
  UserModel _mapFirebaseUser(auth.User? user) {
    if (user == null) {
      return const UserModel.empty();
    }

    var splittedName = ['Name ', 'LastName'];
    if (user.displayName != null) {
      splittedName = user.displayName!.split(' ');
    }

    final map = <String, dynamic>{
      'id': user.uid,
      'firstName': splittedName.first,
      'lastName': splittedName.last,
      'email': user.email ?? '',
      'emailVerified': user.emailVerified,
      'imageUrl': user.photoURL ?? '',
      'isAnonymous': user.isAnonymous,
      'age': 0,
      'phoneNumber': '',
      'address': '',
    };
    return UserModel.fromJson(map);
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _mapFirebaseUser(userCredential.user);
    } on auth.FirebaseAuthException catch (e) {
      throw determineError(e);
    }
  }

  @override
  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _mapFirebaseUser(_firebaseAuth.currentUser!);
    } on auth.FirebaseAuthException catch (e) {
      throw determineError(e);
    }
  }
}

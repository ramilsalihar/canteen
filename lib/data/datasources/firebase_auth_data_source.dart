import 'package:canteen/core/error/auth_error.dart';
import 'package:canteen/core/extensions/string_extension.dart';
import 'package:canteen/data/models/admin_model.dart';
import 'package:canteen/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDataSource {
  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  });

  Future<dynamic> logout();
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  FirebaseAuthDataSourceImpl({
    required FirebaseAuth authService,
  }) : _firebaseAuth = authService;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      return _getUserData(user!);
    } on FirebaseAuthException catch (e) {
      throw determineError(e);
    }
  }

  @override
  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNumber,
    required String role,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = _firebaseAuth.currentUser;

      final name = extractNameFromEmail(email).split(' ')[0];
      final surname = extractNameFromEmail(email).split(' ')[1];

      _fireStore.collection('users').doc(user!.uid).set({
        'name': name,
        'surname': surname,
        'email': email,
        'phoneNumber': phoneNumber,
        'userType': '',
        'balance': 0.0,
        'purchases': [],
      });

      return UserModel(
        id: user.uid,
        name: name,
        surname: surname,
        email: email,
        userType: role,
        phoneNumber: phoneNumber,
        balance: 0.0,
        purchases: const [],
      );
    } on FirebaseAuthException catch (e) {
      throw determineError(e);
    }
  }

  Future<dynamic> _getUserData(User user) async {
    DocumentSnapshot adminDoc =
        await _fireStore.collection('admins').doc(user.uid).get();

    if (adminDoc.exists) {
      return AdminModel(
        id: user.uid,
        name: adminDoc['name'],
        surname: adminDoc['surname'],
        email: adminDoc['email'],
        phoneNumber: adminDoc['phoneNumber'],
        details: adminDoc['details'],
        schedule: adminDoc['schedule'],
      );
    } else {
      DocumentSnapshot userDoc =
          await _fireStore.collection('users').doc(user.uid).get();
      return UserModel(
        id: user.uid,
        name: userDoc['name'],
        surname: userDoc['surname'],
        email: userDoc['email'],
        phoneNumber: userDoc['phoneNumber'],
        userType: userDoc['userType'],
        balance: userDoc['balance'],
        purchases: userDoc['purchases'],
      );
    }
  }

  @override
  Future<dynamic> logout() async {
    await _firebaseAuth.signOut();
  }

  String extractNameFromEmail(String email) {
    List<String> parts = email.split('@');
    List<String> nameParts = parts[0].split(RegExp(r'[._]'));

    String name = nameParts
        .where((part) => part.isNotEmpty)
        .map((part) => part.capitalize())
        .join(' ');

    name = name.replaceAll(RegExp(r'\d+$'), '');

    return name;
  }
}

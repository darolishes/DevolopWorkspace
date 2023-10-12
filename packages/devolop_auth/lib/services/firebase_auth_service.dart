import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../abstract/auth_service.dart';
import '../models/user_model.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return UserModel(
          id: user!.uid, email: user.email!, username: user.displayName ?? '');
    } catch (e) {
      print("An error occurred: $e");
      throw e;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return UserModel(
          id: user.uid, email: user.email!, username: user.displayName ?? '');
    }
    return null;
  }

  @override
  Future<UserModel> create(UserModel entity) {
    throw UnimplementedError('create() is not implemented');
  }

  @override
  Future<UserModel> read(String id) {
    throw UnimplementedError('read() is not implemented');
  }

  @override
  Future<UserModel> update(UserModel entity) {
    throw UnimplementedError('update() is not implemented');
  }

  @override
  Future<void> delete(String id) {
    throw UnimplementedError('delete() is not implemented');
  }
}

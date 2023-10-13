// services/firebase_auth_service.dart
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../abstract/auth_service.dart';
import '../models/user_model.dart';
import '../constants.dart';

class FirebaseAuthService extends AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserModel _userFromFirebase(User? user) {
    return UserModel(
      id: user!.uid,
      email: user.email!,
      username: user.displayName ?? '',
    );
  }

  @override
  Future<UserModel> signUp(
      String email, String password, String username) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      return UserModel(
          id: user!.uid, email: user.email!, username: user.displayName ?? '');
    } catch (e) {
      print(SIGN_IN_ERROR);
      throw e;
    }
  }

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      print(SIGN_IN_ERROR);
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
    await user?.reload();
    user = _firebaseAuth.currentUser;

    if (user != null && user.emailVerified) {
      // Optional: Check if the email is verified
      return UserModel(
        id: user.uid,
        email: user.email!,
        username: user.displayName ?? '',
      );
    }
    return null;
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> sendEmailVerification() async {
    User? user = _firebaseAuth.currentUser;
    await user!.sendEmailVerification();
  }

  @override
  Future<bool> isEmailVerified() async {
    User? user = _firebaseAuth.currentUser;
    await user!.reload();
    user = _firebaseAuth.currentUser;
    return user!.emailVerified;
  }

  @override
  Future<UserModel> create(UserModel entity) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: entity.email, password: entity.password!);

      User user = userCredential.user!;

      return UserModel(
          id: user.uid,
          email: user.email!,
          username: entity.username,
          role: entity.role,
          status: entity.status);
    } catch (e) {
      print(SIGN_UP_ERROR);
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.delete();
      }
    } catch (e) {
      print(SIGN_OUT_ERROR);
      throw e;
    }
  }

  @override
  Future<UserModel> read(String id) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        return UserModel(
            id: user.uid,
            email: user.email!,
            username: user.displayName ?? '',
            role: UserRole.user,
            status: UserStatus.active);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      print(SIGN_OUT_ERROR);
      throw e;
    }
  }

  @override
  Future<UserModel> update(UserModel entity) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updateEmail(entity.email);
        await user.updateDisplayName(entity.username);
        return UserModel(
            id: user.uid,
            email: user.email!,
            username: entity.username,
            role: entity.role,
            status: entity.status);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      print(SIGN_OUT_ERROR);
      throw e;
    }
  }
}

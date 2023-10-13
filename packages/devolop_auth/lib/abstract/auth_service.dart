// abstract/auth_service.dart
import 'dart:async';
import 'package:core/abstract/base_service.dart';
import '../models/user_model.dart';

/// AuthService abstract class: Defines the methods necessary for authentication services.
///
/// This class extends BaseService to provide a common interface for CRUD operations on User.
abstract class AuthService extends BaseService<UserModel> {
  Future<UserModel> signIn(String email, String password);
  Future<UserModel> signUp(String email, String password, String username);
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> sendEmailVerification();
  Future<void> reloadUser();
  Future<bool> isEmailVerified();
}

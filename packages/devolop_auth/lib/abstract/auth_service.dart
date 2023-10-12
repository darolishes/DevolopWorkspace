import 'dart:async';
import 'package:core/abstract/base_service.dart';
import '../models/user_model.dart';

/// AuthService abstract class: Defines the methods necessary for authentication services.
///
/// This class extends BaseService to provide a common interface for CRUD operations on User.
abstract class AuthService extends BaseService<UserModel> {
  /// Signs in a user using email and password.
  Future<UserModel> signIn(String email, String password);

  /// Signs out the currently logged-in user.
  Future<void> signOut();

  /// Fetches the current user.
  Future<UserModel?> getCurrentUser();

  // In AuthService.dart
  Future<void> sendPasswordResetEmail(String email);
  Future<void> verifyEmailAddress();
  Future<bool> isEmailVerified();
  Future<void> updatePassword(String password);
  Future<void> updateEmail(String email);
}

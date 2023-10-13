import 'dart:async';
import 'package:core/abstract/base_service.dart';
import '../models/user_model.dart';

abstract class AuthService extends BaseService<UserModel> {
  Future<UserModel> signIn(String email, String password);
  Future<UserModel> signUp(String email, String password, String username);
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> sendEmailVerification();
  Future<bool> isEmailVerified();
}

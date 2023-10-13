// models/user_model.dart
import 'package:core/abstract/base_model.dart';

enum UserRole { admin, user, guest }

enum UserStatus { active, inactive }

class UserModel extends BaseModel {
  final String email;
  final String username;
  final UserRole role;
  final UserStatus status;
  String? password;

  UserModel({
    required String id,
    required this.email,
    required this.username,
    this.role = UserRole.user,
    this.status = UserStatus.active,
  }) : super(id: id);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'role': role.toString().split('.').last,
      'status': status.toString().split('.').last,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      role: UserRole.values.firstWhere(
        (element) => element.toString().split('.').last == json['role'],
      ),
      status: UserStatus.values.firstWhere(
        (element) => element.toString().split('.').last == json['status'],
      ),
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? username,
    UserRole? role,
    UserStatus? status,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      role: role ?? this.role,
      status: status ?? this.status,
    )..password = password ?? this.password;
  }
}

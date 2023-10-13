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
    this.password,
  }) : super(id: id);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'role': role.toString().split('.').last,
      'status': status.toString().split('.').last,
      'password': password,
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
      password: json['password'],
    );
  }
}

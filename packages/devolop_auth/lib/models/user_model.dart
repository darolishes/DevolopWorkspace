import 'package:core/abstract/base_model.dart';

/// UserModel class: Represents the data structure of a user in the system.
///
/// This class extends BaseModel to inherit the ID and other common features.
class UserModel extends BaseModel {
  final String email;
  final String username;

  UserModel({required String id, required this.email, required this.username})
      : super(id: id);

  /// Converts the object into a JSON map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
    };
  }

  /// Creates an object from a JSON map.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
    );
  }
}

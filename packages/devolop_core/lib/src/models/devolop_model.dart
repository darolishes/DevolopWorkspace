/// Abstract class for models
abstract class DevolopModel {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  DevolopModel(
      {required this.id, required this.createdAt, required this.updatedAt});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String()
    };
  }

  static DevolopModel fromJson(Map<String, dynamic> json) {
    throw UnimplementedError(
        'fromJson() is not implemented for abstract class DevolopModel');
  }
}

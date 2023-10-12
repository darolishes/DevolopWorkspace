/// Abstract class for models
abstract class DevolopModel {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  DevolopModel(
      {required this.id, required this.createdAt, required this.updatedAt});

  /// Convert the object into a JSON map
  Map<String, dynamic> toJson();

  /// Create an object from a JSON map
  static DevolopModel fromJson(Map<String, dynamic> json) {
    throw UnimplementedError(
        'fromJson() is not implemented for abstract class DevolopModel');
  }
}

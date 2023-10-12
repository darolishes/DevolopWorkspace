import 'package:flutter/foundation.dart';

/// BaseModel abstract class: Serves as the schema for various entities.
///
/// This class is intended to be extended by other models.
/// It provides a common interface for CRUD operations.
abstract class BaseModel extends ChangeNotifier {
  final String id;

  BaseModel({required this.id});

  /// Converts the object into a JSON map.
  ///
  /// Implement this method in child classes to
  /// specify how the model is serialized to JSON.
  Map<String, dynamic> toJson();

  /// Creates an object from a JSON map.
  ///
  /// Implement this method in child classes to
  /// specify how the model is deserialized from JSON.
  factory BaseModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson() is not implemented');
  }

  /// Updates the model and notifies all its listeners.
  ///
  /// This is a convenience method to be used in child classes.
  void updateModel() {
    notifyListeners();
  }
}

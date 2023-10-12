// Importing necessary dependencies
import 'package:flutter/foundation.dart';

/// BaseModel: Abstract class serving as the data schema for respective entities.
///
/// The BaseModel class is used to define the data schema for all the entities.
/// It is an abstract class that is extended by all the entities.
/// The class defines the following properties:
/// - id: Unique identifier for the entity.
/// - createdAt: Date and time when the entity was created.
/// - updatedAt: Date and time when the entity was last updated.
///
/// The class also defines the following methods:
/// - toJson: Method to convert the object into a JSON map.
/// - fromJson: Factory method to create an object from a JSON map.
///
abstract class BaseModel {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  BaseModel({required this.id, required this.createdAt, required this.updatedAt});

  /// To JSON: Method to convert the object into a JSON map.
  Map<String, dynamic> toJson();

  /// From JSON: Factory method to create an object from a JSON map.
  factory BaseModel.fromJson(Map<String, dynamic> json);
}
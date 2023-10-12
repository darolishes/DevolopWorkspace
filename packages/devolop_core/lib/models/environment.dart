// Importing required libraries
import 'package:json_annotation/json_annotation.dart';

// Specifies the environment data schema and exports it
@JsonSerializable()
class Environment {
  // Unique identifier for the environment
  final String id;

  // Name of the environment (e.g., Development, Staging, Production)
  final String name;

  // Description for the environment
  final String description;

  // Variables associated with the environment
  final Map<String, String> variables;

  // Constructor for Environment class
  Environment({
    required this.id,
    required this.name,
    required this.description,
    required this.variables,
  });

  // Json serialization methods
  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);
  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}

// Required for the json_serializable package
Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return Environment(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    variables: Map<String, String>.from(json['variables']),
  );
}

// Required for the json_serializable package
Map<String, dynamic> _$EnvironmentToJson(Environment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'variables': instance.variables,
    };

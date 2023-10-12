// Importing required libraries
import 'package:json_annotation/json_annotation.dart';

// Specifies the project data schema and exports it
@JsonSerializable()
class Project {
  // Unique identifier for the project
  final String id;

  // Name of the project
  final String name;

  // Description for the project
  final String description;

  // Status of the project
  final String status;

  // Constructor for Project class
  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
  });

  // Json serialization methods
  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

// Required for the json_serializable package
Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    status: json['status'] as String,
  );
}

// Required for the json_serializable package
Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
    };

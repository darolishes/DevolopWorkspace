// Importing required libraries
import 'package:json_annotation/json_annotation.dart';

// Specifies the server data schema and exports it
@JsonSerializable()
class Server {
  // Unique identifier for the server
  final String id;

  // IP address of the server
  final String ipAddress;

  // Operating system of the server
  final String operatingSystem;

  // Status of the server (e.g., Active, Inactive)
  final String status;

  // Constructor for Server class
  Server({
    required this.id,
    required this.ipAddress,
    required this.operatingSystem,
    required this.status,
  });

  // Json serialization methods
  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);
  Map<String, dynamic> toJson() => _$ServerToJson(this);
}

// Required for the json_serializable package
Server _$ServerFromJson(Map<String, dynamic> json) {
  return Server(
    id: json['id'] as String,
    ipAddress: json['ipAddress'] as String,
    operatingSystem: json['operatingSystem'] as String,
    status: json['status'] as String,
  );
}

// Required for the json_serializable package
Map<String, dynamic> _$ServerToJson(Server instance) => <String, dynamic>{
      'id': instance.id,
      'ipAddress': instance.ipAddress,
      'operatingSystem': instance.operatingSystem,
      'status': instance.status,
    };

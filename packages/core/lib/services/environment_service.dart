// Importing required libraries and models
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/environment.dart';

class EnvironmentService {
  // Base URL for API calls related to Environment
  final String baseUrl;

  // Constructor for EnvironmentService
  EnvironmentService({required this.baseUrl});

  // Fetch environment by its ID
  Future<Environment> getEnvironmentById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/environments/$id'));

    if (response.statusCode == 200) {
      return Environment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load environment');
    }
  }

  // Create a new environment
  Future<Environment> createEnvironment(Environment environment) async {
    final response = await http.post(
      Uri.parse('$baseUrl/environments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(environment.toJson()),
    );

    if (response.statusCode == 201) {
      return Environment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create environment');
    }
  }

  // Update an existing environment by ID
  Future<Environment> updateEnvironment(
      String id, Environment environment) async {
    final response = await http.put(
      Uri.parse('$baseUrl/environments/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(environment.toJson()),
    );

    if (response.statusCode == 200) {
      return Environment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update environment');
    }
  }

  // Delete an environment by its ID
  Future<void> deleteEnvironment(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/environments/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete environment');
    }
  }
}

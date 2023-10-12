// Importing required libraries and models
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/project.dart';

class ProjectService {
  // Base URL for API calls related to Project
  final String baseUrl;

  // Constructor for ProjectService
  ProjectService({required this.baseUrl});

  // Fetch project by its ID
  Future<Project> getProjectById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/projects/$id'));

    if (response.statusCode == 200) {
      return Project.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load project');
    }
  }

  // Create a new project
  Future<Project> createProject(Project project) async {
    final response = await http.post(
      Uri.parse('$baseUrl/projects'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(project.toJson()),
    );

    if (response.statusCode == 201) {
      return Project.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create project');
    }
  }

  // Update an existing project by ID
  Future<Project> updateProject(String id, Project project) async {
    final response = await http.put(
      Uri.parse('$baseUrl/projects/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(project.toJson()),
    );

    if (response.statusCode == 200) {
      return Project.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update project');
    }
  }

  // Delete a project by its ID
  Future<void> deleteProject(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/projects/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete project');
    }
  }
}

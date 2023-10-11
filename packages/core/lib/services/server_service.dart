// Importing required libraries and models
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/server.dart';

class ServerService {
  // Base URL for API calls related to Server
  final String baseUrl;

  // Constructor for ServerService
  ServerService({required this.baseUrl});

  // Fetch server by its ID
  Future<Server> getServerById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/servers/$id'));

    if (response.statusCode == 200) {
      return Server.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load server');
    }
  }

  // Create a new server
  Future<Server> createServer(Server server) async {
    final response = await http.post(
      Uri.parse('$baseUrl/servers'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(server.toJson()),
    );

    if (response.statusCode == 201) {
      return Server.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create server');
    }
  }

  // Update an existing server by ID
  Future<Server> updateServer(String id, Server server) async {
    final response = await http.put(
      Uri.parse('$baseUrl/servers/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(server.toJson()),
    );

    if (response.statusCode == 200) {
      return Server.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update server');
    }
  }

  // Delete a server by its ID
  Future<void> deleteServer(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/servers/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete server');
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error/exceptions.dart';
import '../models/system_model.dart';
import '../models/system_operation_model.dart';

abstract class SystemRemoteDataSource {
  /// Calls the http://example.com/system/status endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<SystemModel> getSystemStatus();

  /// Calls the http://example.com/system/update endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> updateSystemParameter(String parameter, dynamic value);

  /// Calls the http://example.com/system/start endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> startSystem();

  /// Calls the http://example.com/system/stop endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<void> stopSystem();

  /// Calls the http://example.com/system/history endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<SystemOperationModel>> getOperationHistory();

  /// Establishes a WebSocket connection to receive real-time updates.
  ///
  /// Throws a [ServerException] if connection fails.
  Stream<SystemModel> getSystemUpdates();
}

class SystemRemoteDataSourceImpl implements SystemRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  SystemRemoteDataSourceImpl({required this.client, required this.baseUrl});

  @override
  Future<SystemModel> getSystemStatus() async {
    final response = await client.get(
      Uri.parse('$baseUrl/system/status'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return SystemModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> updateSystemParameter(String parameter, dynamic value) async {
    final response = await client.post(
      Uri.parse('$baseUrl/system/update'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'parameter': parameter, 'value': value}),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> startSystem() async {
    final response = await client.post(
      Uri.parse('$baseUrl/system/start'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> stopSystem() async {
    final response = await client.post(
      Uri.parse('$baseUrl/system/stop'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<List<SystemOperationModel>> getOperationHistory() async {
    final response = await client.get(
      Uri.parse('$baseUrl/system/history'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map((json) => SystemOperationModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Stream<SystemModel> getSystemUpdates() {
    // This is a simplified implementation. In a real-world scenario,
    // you'd use a WebSocket connection here.
    return Stream.periodic(Duration(seconds: 1), (_) {
      return SystemModel(
        temperature: 25.0 + (DateTime.now().second / 60) * 10,
        pressure: 1.0 + (DateTime.now().second / 60) * 0.5,
        flowRate: 5.0 + (DateTime.now().second / 60) * 2,
        isOperational: true,
      );
    });
  }
}
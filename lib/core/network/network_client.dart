import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';

/// HTTP client for making network requests with proper error handling.
class NetworkClient {
  const NetworkClient({required this.client, required this.logger});

  final http.Client client;
  final Logger logger;

  /// Makes a GET request to the specified URL.
  Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    try {
      logger.d('GET request to: $url');

      final response = await client
          .get(Uri.parse(url), headers: headers)
          .timeout(timeout ?? const Duration(seconds: 30));

      logger.d('GET response status: ${response.statusCode}');
      return response;
    } on SocketException {
      logger.e('Network error: No internet connection');
      throw const NetworkFailure(message: 'No internet connection');
    } on HttpException catch (e) {
      logger.e('HTTP error: ${e.message}');
      throw NetworkFailure(message: e.message);
    } catch (e) {
      logger.e('Unexpected error: $e');
      throw UnknownFailure(message: e.toString());
    }
  }

  /// Makes a POST request to the specified URL.
  Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Duration? timeout,
  }) async {
    try {
      logger.d('POST request to: $url');

      final response = await client
          .post(
            Uri.parse(url),
            headers: headers,
            body: body is Map ? jsonEncode(body) : body,
          )
          .timeout(timeout ?? const Duration(seconds: 30));

      logger.d('POST response status: ${response.statusCode}');
      return response;
    } on SocketException {
      logger.e('Network error: No internet connection');
      throw const NetworkFailure(message: 'No internet connection');
    } on HttpException catch (e) {
      logger.e('HTTP error: ${e.message}');
      throw NetworkFailure(message: e.message);
    } catch (e) {
      logger.e('Unexpected error: $e');
      throw UnknownFailure(message: e.toString());
    }
  }

  /// Makes a PUT request to the specified URL.
  Future<http.Response> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Duration? timeout,
  }) async {
    try {
      logger.d('PUT request to: $url');

      final response = await client
          .put(
            Uri.parse(url),
            headers: headers,
            body: body is Map ? jsonEncode(body) : body,
          )
          .timeout(timeout ?? const Duration(seconds: 30));

      logger.d('PUT response status: ${response.statusCode}');
      return response;
    } on SocketException {
      logger.e('Network error: No internet connection');
      throw const NetworkFailure(message: 'No internet connection');
    } on HttpException catch (e) {
      logger.e('HTTP error: ${e.message}');
      throw NetworkFailure(message: e.message);
    } catch (e) {
      logger.e('Unexpected error: $e');
      throw UnknownFailure(message: e.toString());
    }
  }

  /// Makes a DELETE request to the specified URL.
  Future<http.Response> delete(
    String url, {
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    try {
      logger.d('DELETE request to: $url');

      final response = await client
          .delete(Uri.parse(url), headers: headers)
          .timeout(timeout ?? const Duration(seconds: 30));

      logger.d('DELETE response status: ${response.statusCode}');
      return response;
    } on SocketException {
      logger.e('Network error: No internet connection');
      throw const NetworkFailure(message: 'No internet connection');
    } on HttpException catch (e) {
      logger.e('HTTP error: ${e.message}');
      throw NetworkFailure(message: e.message);
    } catch (e) {
      logger.e('Unexpected error: $e');
      throw UnknownFailure(message: e.toString());
    }
  }

  /// Disposes the HTTP client.
  void dispose() {
    client.close();
  }
}

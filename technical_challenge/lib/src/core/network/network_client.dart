import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../constants/app_constants.dart';

/// {@template network_client}
/// HTTP client for making network requests.
/// {@endtemplate}
class NetworkClient {
  /// {@macro network_client}
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
          .timeout(
            timeout ??
                const Duration(seconds: AppConstants.defaultTimeoutDuration),
          );

      logger.d('GET response status: ${response.statusCode}');
      return response;
    } on SocketException {
      logger.e('Network error: No internet connection');
      rethrow;
    } on HttpException catch (e) {
      logger.e('HTTP error: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected error: $e');
      rethrow;
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
          .timeout(
            timeout ??
                const Duration(seconds: AppConstants.defaultTimeoutDuration),
          );

      logger.d('POST response status: ${response.statusCode}');
      return response;
    } on SocketException {
      logger.e('Network error: No internet connection');
      rethrow;
    } on HttpException catch (e) {
      logger.e('HTTP error: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected error: $e');
      rethrow;
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
          .timeout(
            timeout ??
                const Duration(seconds: AppConstants.defaultTimeoutDuration),
          );

      logger.d('PUT response status: ${response.statusCode}');
      return response;
    } on SocketException {
      logger.e('Network error: No internet connection');
      rethrow;
    } on HttpException catch (e) {
      logger.e('HTTP error: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected error: $e');
      rethrow;
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
          .timeout(
            timeout ??
                const Duration(seconds: AppConstants.defaultTimeoutDuration),
          );

      logger.d('DELETE response status: ${response.statusCode}');
      return response;
    } on SocketException {
      logger.e('Network error: No internet connection');
      rethrow;
    } on HttpException catch (e) {
      logger.e('HTTP error: ${e.message}');
      rethrow;
    } catch (e) {
      logger.e('Unexpected error: $e');
      rethrow;
    }
  }

  /// Disposes the HTTP client.
  void dispose() {
    client.close();
  }
}

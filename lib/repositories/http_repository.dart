import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../providers/auth_provider.dart';

abstract class HttpRepository {
  static const _baseURL = 'https://tcc.g7code.com.br/api';
  // static const _baseURL = 'http://10.0.2.2:8000/api';
  static const int _connectTimeout = 10000;

  final _authProvider = Get.put(AuthProvider());

  final Map<String, String> _headers = {
    'Accept': 'application/json',
    "Content-Type": "application/json"
  };

  /*
  |--------------------------------------------------------------------------
  | Get method
  |--------------------------------------------------------------------------
  */
  Future<Map<String, dynamic>> get(String endpoint) async {
    _headers['Authorization'] = 'Bearer ${_authProvider.userToken}';

    try {
      final http.Response rawResponse = await http
          .get(Uri.parse('$_baseURL$endpoint'), headers: _headers)
          .timeout(const Duration(milliseconds: _connectTimeout));

      return {
        'statusCode': rawResponse.statusCode,
        'body': jsonDecode(rawResponse.body),
      };
    } on TimeoutException catch (_) {
      return {
        'statusCode': 408,
        'body': {'message': 'Tempo excedido.'},
      };
    } on Exception catch (e) {
      return {
        'statusCode': 500,
        'body': {'message': e},
      };
    }
  }

  /*
  |--------------------------------------------------------------------------
  | Post method
  |--------------------------------------------------------------------------
  */
  Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    _headers['Authorization'] = 'Bearer ${_authProvider.userToken}';

    try {
      final http.Response rawResponse = await http
          .post(Uri.parse('$_baseURL$endpoint'),
              headers: _headers, body: jsonEncode(body))
          .timeout(const Duration(milliseconds: _connectTimeout));

      return {
        'statusCode': rawResponse.statusCode,
        'body': jsonDecode(rawResponse.body),
      };
    } on TimeoutException catch (_) {
      return {
        'statusCode': 408,
        'body': {'message': 'Tempo excedido.'},
      };
    } on Exception catch (e) {
      return {
        'statusCode': 500,
        'body': {'message': e},
      };
    }
  }

  /*
  |--------------------------------------------------------------------------
  | Put method
  |--------------------------------------------------------------------------
  */
  Future<Map<String, dynamic>> put(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    _headers['Authorization'] = 'Bearer ${_authProvider.userToken}';

    try {
      final http.Response rawResponse = await http
          .put(Uri.parse('$_baseURL$endpoint'),
              headers: _headers, body: jsonEncode(body))
          .timeout(const Duration(milliseconds: _connectTimeout));

      return {
        'statusCode': rawResponse.statusCode,
        'body': jsonDecode(rawResponse.body),
      };
    } on TimeoutException catch (_) {
      return {
        'statusCode': 408,
        'body': {'message': 'Tempo excedido.'},
      };
    } on Exception catch (e) {
      return {
        'statusCode': 500,
        'body': {'message': e},
      };
    }
  }

  /*
  |--------------------------------------------------------------------------
  | Delete method
  |--------------------------------------------------------------------------
  */
  Future<Map<String, dynamic>> delete(String endpoint) async {
    _headers['Authorization'] = 'Bearer ${_authProvider.userToken}';

    try {
      final http.Response rawResponse = await http
          .delete(Uri.parse('$_baseURL$endpoint'), headers: _headers)
          .timeout(const Duration(milliseconds: _connectTimeout));

      return {
        'statusCode': rawResponse.statusCode,
        'body': jsonDecode(rawResponse.body),
      };
    } on TimeoutException catch (_) {
      return {
        'statusCode': 408,
        'body': {'message': 'Tempo excedido.'},
      };
    } on Exception catch (e) {
      return {
        'statusCode': 500,
        'body': {'message': e},
      };
    }
  }
}

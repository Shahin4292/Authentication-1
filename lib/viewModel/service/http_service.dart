import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/login_request.dart';
import '../../models/login_response.dart';
import '../../models/user_details_response.dart';
import '../../models/password_change_request.dart';
import '../../models/password_change_response.dart';
import '../../models/logout_response.dart';

class HttpService {
  static final HttpService _instance = HttpService._internal();
  factory HttpService() => _instance;
  HttpService._internal();

  static const String baseUrl = 'https://flutter.vmx.link';
  String? _token;
  late Dio _dio;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');

    // Configure Dio to bypass SSL verification
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<void> setToken(String token) async {
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> clearToken() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _dio.post(
      '/login',
      data: request.toJson(),
      options: Options(headers: _getHeaders()),
    );
    return LoginResponse.fromJson(response.data);
  }

  Future<UserDetailsResponse> getUserDetails() async {
    final response = await _dio.get(
      '/details',
      options: Options(headers: _getHeaders()),
    );
    return UserDetailsResponse.fromJson(response.data);
  }

  Future<PasswordChangeResponse> changePassword(
      PasswordChangeRequest request) async {
    final response = await _dio.post(
      '/passwordchange',
      data: request.toJson(),
      options: Options(headers: _getHeaders()),
    );
    return PasswordChangeResponse.fromJson(response.data);
  }

  Future<LogoutResponse> logout() async {
    final response = await _dio.get(
      '/logout',
      options: Options(headers: _getHeaders()),
    );
    return LogoutResponse.fromJson(response.data);
  }

  Map<String, String> _getHeaders() {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      if (_token != null) 'Authorization': 'Bearer $_token',
    };
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quick_task/models/user_model.dart';
import 'package:quick_task/services/auth_services.dart';

class UserServices {
  final String baseURL = 'http://10.0.2.2:8000/api';
  final FlutterSecureStorage storage = FlutterSecureStorage();

  // to register user
  Future<UserModel> registerUser(Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseURL/register/user/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        final AuthServices authServices = AuthServices();
        await authServices.saveTokens(
            responseData['refresh'], responseData['access']);
        return UserModel.fromJson(responseData);
      } else {
        final errorResponse = json.decode(response.body);
        throw Exception(
            'Failed to register user: ${errorResponse['detail'] ?? 'Unknown error'}');
      }
    } catch (e) {
      throw Exception('Error during registration: $e');
    }
  }

  // to login user
  Future<bool> loginUser(Map<String, dynamic> loginCredentials) async {
    final String URL = '$baseURL/token/';

    try {
      final response = await http.post(
        Uri.parse(URL),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(loginCredentials),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // await saveTokens(responseData['refresh'], responseData['access']);
        return true;
      } else {
        final errorResponse = json.decode(response.body);
        // throw Exception(
        //     'Login failed: ${errorResponse['detail'] ?? 'Unknown error'}');
        return false;
      }
    } catch (e) {
      print('Error during login request: $e');
      throw Exception('Login request error: $e');
    }
  }

  // Save tokens securely
  Future<void> saveTokens(String refreshToken, String accessToken) async {
    try {
      if (refreshToken.isNotEmpty && accessToken.isNotEmpty) {
        await storage.write(key: 'access_token', value: accessToken);
        await storage.write(key: 'refresh_token', value: refreshToken);
      } else {
        throw Exception('Tokens are empty');
      }
    } catch (e) {
      print('Error saving tokens: $e');
      throw Exception('Error saving tokens: $e');
    }
  }
}

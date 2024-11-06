import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quick_task/models/user_model.dart';

class UserServices {
  final String baseURL = 'http://10.0.2.2:8000/api';

// to register user
  Future<UserModel> registerUser(Map<String, dynamic> userData) async {
    print(userData);
    final response = await http.post(
      Uri.parse('$baseURL/register/user/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );

    if (response.statusCode == 201) {
      return UserModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      throw Exception('Bad request: ${response.body}');
    } else if (response.statusCode == 500) {
      throw Exception('Server error: ${response.body}');
    } else {
      throw Exception('Failed to register user: ${response.body}');
    }
  }
}

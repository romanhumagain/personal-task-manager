import 'package:flutter/material.dart';
import 'package:quick_task/api/base_endpoint.dart';
import 'package:quick_task/models/todo_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quick_task/services/auth_services.dart';

class TodoServices {
  Future<TodoModel?> addTodo(Map<String, dynamic> todoData) async {
    AuthServices authServices = AuthServices();

    try {
      const url = '${BaseEndpoint.baseUrl}/task/';
      final accessToken = await authServices.getAccessToken();

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
        body: json.encode(todoData),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return TodoModel.fromJson(responseData);
      } else if (response.statusCode == 400) {
        throw Exception("Bad request error: ${response.body}");
      } else if (response.statusCode == 401) {
        await authServices.logoutUser();
        throw Exception("Unauthorized. Please log in again.");
      } else {
        throw Exception(
            "Unexpected error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      // Log or print the actual error message for debugging
      print('Error in TodoServices.addTodo: $e');
      throw Exception(
          'Error during Adding Todo: $e'); // Append original exception
    }
  }
}

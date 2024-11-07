import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthServices {
  Future<void> saveTokens(String refreshToken, String accessToken) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('refreshToken', refreshToken);
    await preferences.setString('accessToken', accessToken);
  }

  // to get access token
  Future<String?> getAccessToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('accessToken');
  }

  // to get refresh token
  Future<String?> getRefreshToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('refreshToken');
  }

  // to clear tokens or to logout
  Future<void> logoutUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('refreshToken');
    await preferences.remove('accessToken');
  }

  // to check whether the token is valid or not and user is loggedin or not
  Future<bool> isLoggedIn() async {
    String? token = await getAccessToken();
    if (token != null && !JwtDecoder.isExpired(token)) {
      return true;
    } else {
      return false;
    }
  }

// to refresh the access token through accesstoken
  Future<void> refreshAccessToken() async {
    final refreshToken = await getRefreshToken();
    const url = "http://127.0.0.1:8000/api/token/refresh/";

    if (refreshToken != null) {
      try {
        final response = await http.post(Uri.parse(url),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'refresh': refreshToken}));

        if (response.statusCode == 200) {
          final responseData = await jsonDecode(response.body);

          await saveTokens(responseData['refresh'], responseData['access']);
        } else if (response.statusCode == 401) {
          logoutUser();
        } else {
          throw Exception("Failed to refresh token: ${response.body}");
        }
      } catch (e) {
        throw Exception('Error refreshing token: $e');
      }
    } else {
      throw Exception("Token not found");
    }
  }
}

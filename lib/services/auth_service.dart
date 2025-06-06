import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static String? accessToken;
  static String? refreshToken;

  static const baseUrl = 'http://10.0.2.2:8000/api';

  // Sign Up
  static Future<String?> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String password1,
    required String password2,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'password1': password1,
        'password2': password2,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      return 'Signup failed: ${response.body}';
    }
  }

  // Sign In
  static Future<bool> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signin/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      accessToken = data['access'];
      refreshToken = data['refresh']; // Expect this from backend
      return true;
    }
    return false;
  }

  // Get Current Authenticated User Info
  static Future<Map<String, dynamic>?> getUserInfo() async {
    if (accessToken == null) return null;

    final response = await http.get(
      Uri.parse('$baseUrl/auth/users/me/'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  // Refresh Access Token
  static Future<bool> refreshAccessToken() async {
    if (refreshToken == null) return false;

    final response = await http.post(
      Uri.parse('$baseUrl/auth/token/refresh/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refresh': refreshToken}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      accessToken = data['access'];
      return true;
    }
    return false;
  }

  // Logout
  static Future<void> logout() async {
    if (accessToken == null) return;

    await http.post(
      Uri.parse('$baseUrl/auth/logout/'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    accessToken = null;
    refreshToken = null;
  }
}

import 'dart:convert';
import "package:http/http.dart" as http;

class ApiService {
  final String baseUrl = "https://yourwebsite.com/api"; // غيّر المسار حسب موقعك

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login.php"),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'status': 'error', 'message': 'Server error: ${response.statusCode}'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Connection failed: $e'};
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:stc_health/Domain/Models/user_model.dart';
  

 class LoginRepository {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<String> login(String username, String password) async {
    final userData = {'username': username, 'password': password}; 
     
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData), // Serialize the Map to JSON format
    );

    if(response.statusCode == 400){
      print('Login failed: ${response.body}');
    }


    if (response.statusCode == 401) {
      print('Unauthorized: ${response.body}');
    }


    if (response.statusCode == 200) {
      print('Login successful');
      final responseData = jsonDecode(response.body);
      return responseData['token'] as String;
    } else {
      throw Exception('Failed to login. Status code: ${response.statusCode}');
    }
  
  }

}








 
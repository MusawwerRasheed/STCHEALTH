 import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:stc_health/Domain/Models/user_model.dart';

  class User {
  final String username;
  final String password;

  User({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': username,
      'password': password,
    };
  }
}


 

 


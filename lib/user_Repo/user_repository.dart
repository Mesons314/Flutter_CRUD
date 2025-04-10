import 'dart:convert';

import 'package:crud_frontend/Models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  final String baseUrl = 'http://192.168.0.107:8080/flutter';

  Future<void> addUser(User user)async {
    final res = await http.post(
      Uri.parse('$baseUrl/add'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson())
    );
    if(res.statusCode == 200 || res.statusCode == 201){
      print('everything is fine');
    }else{
      print('Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');
      throw Exception("Failed to save user");
    }
  }
}

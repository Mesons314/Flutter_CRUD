import 'dart:convert';

import 'package:crud_frontend/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class user_repository{
  final String baseUrl = 'https/localhost:8080/api/..';

  Future<void> addUser(User user)async {
    final res = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content Type': 'application/json'},
      body: jsonEncode(user.toJson())
    );
    if(res.statusCode == 201){
      print('everything is fine');
    }else{
      throw Exception("Failed to save user");
    }
  }
}

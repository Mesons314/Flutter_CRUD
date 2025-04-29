import 'dart:convert';

import 'package:crud_frontend/Models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  final String baseUrl = 'http://192.168.0.105:8080/flutter';

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

  Future<List<User>> getUser() async{
    final res = await http.get(
      Uri.parse('$baseUrl/getUser'),
    );
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      return body.map((e) => User.fromJson(e)).toList();
    } else {
      print('Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');
      throw Exception("Failed to load data");
    }
  }
  
  Future<User> getUserById(int id) async{
    final res = await http.get(
      Uri.parse('$baseUrl/getById/$id')
    );
    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    } else {
      print('Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');
      throw Exception("Failed to load data");
    }
  }
  
  Future<void> deleteById(int id) async{
    final res = await http.delete(
      Uri.parse('$baseUrl/delete/$id')
    );
    if (res.statusCode == 200) {
      print('Data Deleted');
    } else {
      print('Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');
      throw Exception("Failed to delete data");
    }
  }

  Future<void> updateUser1(int id , User user) async{
    final res = await http.put(
        Uri.parse('$baseUrl/update/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()));
    if(res.statusCode == 200 || res.statusCode == 201){
      print('everything is fine');
    }else{
      print('Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');
      throw Exception("Failed to save user");
    }
  }
}

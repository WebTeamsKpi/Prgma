import 'dart:convert';

import 'package:http/http.dart';
import 'package:prgma/models/User.dart';

class RouterOfHttp {
 

  static Future<User> createUser(User user) async {
    final response = await post(
      Uri.parse('http://localhost:3000/authentication/addUser'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to create user');
    }
  }

  static Future<User> getUsers(String name, String password) async {
    Response res = await get(
        Uri.parse('http://localhost:3000/authentication/user/'+name+'/'+password));
    if (res.statusCode == 200) {
    
      print(res.body);
      User user = User.fromJson(jsonDecode(res.body));
      return user;
    } else {
      throw "Unable to retrieve user.";
    }
  }
}

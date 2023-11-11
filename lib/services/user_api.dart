import 'dart:convert';
import 'package:flutter_restapi_example/model/user.dart';
import 'package:http/http.dart' as http;

class UserApi{
 static Future<List<User>> fetchUsers() async{
    const uri="https://randomuser.me/api/?results=30";
    final url =Uri.parse(uri);
    final response = await http.get(url);
    final body=response.body;
    final json=jsonDecode(body);
    final results= json["results"] as List<dynamic>;
    final users= results.map((e){
      return User.fromMap(e);
    }).toList();
    return users;
  }
}
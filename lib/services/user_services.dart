import 'dart:convert' as convert;

import 'package:add_data/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserService {
  var http = Dio();
  var base_url = 'http://localhost:3004';

  Future<dynamic> getUser() async {
    return await http.get('${base_url}/users');
  }

  Future postUser(Map<String, dynamic> data) async {
    return await http.post('${base_url}/users', data: data);
  }

  // Future<User?> getUser() async {
  //   User? user;
  //   try {
  //     var response = await http.get('${base_url}/users');
  //     var result = response.data.toString();
  //     print('===> ${response}');
  //     if (response.statusCode == 200) {
  //       return User.fromJson(convert.jsonDecode(response.data));
  //       //   return response.data;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }

  // if (response.statusCode == 200) {
  //   return User.fromJson(jsonDecode(response.data));
  // } else {
  // return Future.error(response.statusMessage!);as Map<String, dynamic>
  // }
  // }
}

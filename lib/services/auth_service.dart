import 'dart:convert';

import 'package:shamo/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'username': username,
      'password': password,
      'phone': '088888128',
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["data"];
      UserModel user = UserModel.fromJson(data["user"]);
      user.token = 'Bearer ${data["access_token"]}';

      return user;
    } else {
      throw Exception('Gagal melakukan register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)["data"];
      UserModel user = UserModel.fromJson(data["user"]);
      user.token = 'Bearer ${data["access_token"]}';

      return user;
    } else {
      throw Exception('Gagal login');
    }
  }
}

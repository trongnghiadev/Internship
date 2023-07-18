import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/models/user_model.dart';

class AuthorizationData {
  Dio dio = Dio();

  Future<User?> login(String email, String password) async {
    try {
      final response = await dio.post(
        Api().convertApi(Api.apiLogin),
        data: FormData.fromMap({email: email, password: password}),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final json = jsonDecode(data);
        return User.fromJson(json['data']['user']);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

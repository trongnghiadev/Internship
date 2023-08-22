import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/api.dart';

class Login {
  Dio dio = Dio();

  Future<User?> fetchData(String email, String password) async {
    try {
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final loginResponse = await dio.post(
        Api().convertApi(Api.apiLogin),
        data: {
          "email": email,
          "password": password,
        },
        options: options,
      );

      if (loginResponse.statusCode == 200) {
        final data = loginResponse.data;
        final json = jsonDecode(data);
        final status = json['status'];

        if (status == 'true') {
          //coi lại đoạn này
          final userModel = User.fromJson(json['data']['user']);
          SharedPreferences prefs =
              await SharedPreferences.getInstance(); // Lưu email đã đăng nhập
          prefs
              .setString('token', json['data']['token'] ?? '')
              .timeout(const Duration(days: 15));

          return userModel;
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

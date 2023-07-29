import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:login_2/models/user.model.dart';
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
          return userModel;
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

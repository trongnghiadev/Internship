import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class RegisterData {
  Dio dio = Dio();

  Future<String?> fetchData(String email) async {
    try {
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final registerResponse = await dio.post(
        Api().convertApi(Api.apiRegister),
        data: {"email": email},
        options: options,
      );
      if (registerResponse.statusCode == 200) {
        String register = '';
        final data = registerResponse.data;
        final json = jsonDecode(data);

        register = json['status'].toString();
        return register;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

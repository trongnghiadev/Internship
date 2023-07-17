import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class SetNewPass {
  Dio dio = Dio();

  Future<String?> fetchData(String email, String pass) async {
    try {
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final setNewPass = await dio.post(
        Api().convertApi(Api.apiSetNewPass),
        data: {"email": email, "pass": pass},
        options: options,
      );

      if (setNewPass.statusCode == 200) {
        String newPassCheck = '';
        final data = setNewPass.data;
        final json = jsonDecode(data);

        newPassCheck = json['status'].toString();
        return newPassCheck;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

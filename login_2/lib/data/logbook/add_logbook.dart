import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:login_2/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/socialLogin/login_screen.dart';

class AddLogBook {
  Dio dio = Dio();

  // Các thuộc tính mới
  int? productId;
  String? content;

  Future<String?> fetchData() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập

    String? token = prefs.getString('token');
    if (token == null) return Get.offAll(() => const LoginScreen());

    try {
      dio.options.headers["authorization"] = token;

      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final createLogBookResponse = await dio.post(
        Api().convertApi(Api.apiAddLogBooks),
        data: {
          "productId": productId,
          "content": content,
        },
        options: options,
      );

      if (createLogBookResponse.statusCode == 200) {
        String addLogBookResult = '';
        final data = createLogBookResponse.data;
        final json = jsonDecode(data);

        addLogBookResult = json['status'].toString();
        return addLogBookResult;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

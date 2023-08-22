import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/product_detail_model.dart';

class GetLogBook {
  Dio dio = Dio();

  Future<LogBooks?> fetchData(int idCompany) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập

    String? token = prefs.getString('token');
    if (token == null) return Get.offAll(() => const LoginScreen());

    try {
      dio.options.headers["authorization"] = token;

      final getLogBookResponse =
          await dio.get('${Api().convertApi(Api.apiGetLogBook)}/$idCompany');

      if (getLogBookResponse.statusCode == 200) {
        final data = getLogBookResponse.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          LogBooks logBook = LogBooks.fromJson(jsonData['data']);
          return logBook;
        }
      }
    } catch (e) {
      print('Lỗi API getLogBook: $e');
      return null;
    }
    return null;
  }
}

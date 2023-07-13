import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:login_2/config/api.dart';

class checkExistEmail {
  Dio dio = Dio();

  Future<String?> fetchData(String email) async {
    try {
      final checkExistEmailResponse =
          await dio.get('${Api().convertApi(Api.apiCheckExistEmail)}/$email');

      if (checkExistEmailResponse.statusCode == 200) {
        String existEmail = '';

        final data = checkExistEmailResponse.data;

        final json = jsonDecode(data);
        existEmail = json['status'].toString();
        return existEmail;
      }
    } catch (e) {
      if (kDebugMode) {
        //Nên viết như vầy để hiện lỗi rõ nhất
        print('Lỗi API checkExistEmail: $e');
      }
    }
    return null;
  }
}

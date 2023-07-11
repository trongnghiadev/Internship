import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class checkOtp {
  Dio dio = Dio();

  Future<String?> fetchData(String email, String otp) async {
    try {
      print(Api().convertApi(Api.apiCheckOtp));

      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );
      final checkOtpResponse = await dio.post(
        Api().convertApi(Api.apiCheckOtp),
        data: {"email": email, "otp": otp},
        options: options,
      );

      if (checkOtpResponse.statusCode == 200) {
        String otpCheck = '';
        final data = checkOtpResponse.data;
        final json = jsonDecode(data);

        otpCheck = json['status'].toString();
        return otpCheck;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

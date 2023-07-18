import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class ResendOtp {
  Dio dio = Dio();

  Future<String?> fetchData(String email) async {
    try {
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final resendOtpResponse = await dio.post(
        Api().convertApi(Api.apiResendOtp),
        data: {"email": email},
        options: options,
      );

      if (resendOtpResponse.statusCode == 200) {
        String otpCheck = '';
        final data = resendOtpResponse.data;
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

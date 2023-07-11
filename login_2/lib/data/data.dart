import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:login_2/config/api.dart';
import 'package:login_2/screens/otp_screen.dart';
import 'package:login_2/screens/signup_screen.dart';

class OTPData {
  Dio dio = Dio();
  Future<void> fetchData(String email, BuildContext context) async {
    try {
      print(Api().convertApi(Api.apiCheckEmail) + email);
      final response =
          await dio.get(Api().convertApi(Api.apiCheckEmail) + '/$email');
      String status = '';

      if (response.statusCode == 200) {
        final data = response.data;
        final json = jsonDecode(data);
        status = json['status'];

        if (status == 'false') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpScreen(
                      email: email,
                    )),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpScreen(
                      email: email,
                    )),
          );
          print('Tài khoản đã tồn tại');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future checkOTP(String email, String optCode) async {
    final response = await dio.post(Api().convertApi(Api.apiCheckOtp),
        options: Options(
            headers: {"Content-Type": "application/x-www-form-urlencoded"}),
        data: convert.jsonEncode({"email": email, "otp": optCode}));
    if ((jsonDecode(response.data))['status'] == true) {
      Get.to(() => SignupScreen());
    } else {}
  }
}

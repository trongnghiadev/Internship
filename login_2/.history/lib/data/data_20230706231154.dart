import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> fetchData(String email) async {
  final url = 'https://stg.utrace.net/users/$email';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // Xử lý dữ liệu khi nhận được response thành công
    final data = response.body;
    print(data);
  } else {
    // Xử lý lỗi khi không nhận được response thành công
    print('Error: ${response.statusCode}');
  }
}

Future checkOtp(String email, String otp) async {
  try {
    var res = await accountReposipory.checkOtp(email, otp);
    if (res != null && res.statusCode == 200) {
      signup();
    }
  } catch (e) {
    Common.showSnackBar(
        NavigateKeys().navigationKey.currentContext!, 'Mã OTP không đúng');
  }
}

Future sendOpt(String email, TypeOTP typeOTP, {String? password, String? name}) async {
  try {
    var res = await accountReposipory.sendOtp(phone);
    if (res != null && res.statusCode == 200) {
      Navigator.push(
        NavigateKeys().navigationKey.currentContext!,
        MaterialPageRoute(builder: (context) => ConfirmOtp(
          typeOTP: typeOTP,
          email: email,
          password: password ?? '',
        ))
      )
    }
  }
}

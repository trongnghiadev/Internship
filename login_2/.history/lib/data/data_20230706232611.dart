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

Future<void> sendOtp(String email, TypeOTP typeOTP, {String? password, String? name}) async {
  try {
    var res = await accountRepository.sendOtp(email);
    if (res != null && res.statusCode == 200) {
      Navigator.push(
        NavigateKeys().navigationKey.currentContext!,
        MaterialPageRoute(builder: (context) => ConfirmOtp(
          typeOTP: typeOTP,
          email: email,
          password: password ?? '',
        )),
      );
    } else {
      Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Sai thông tin');
    }
  } catch(e) {
    Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Có lỗi xảy ra');
  }
}

Future<void> signup() async {
  try {
    updateFormSignup(acceptDate: Utils().convertDateToString(DateTime.now()), code: SignupModel.email, noteActive: '');
    var res = await accountRepository.signup(SignupModel);
    if (res != null && res.data is String) {
      Navigator.pushNamedAndRemoveUntil(NavigateKeys().navigationKey.currentContext!, AppRouter.loginScreen, (route) => false);
      Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Đăng kí thành công');
    }
  } catch (e) {
    print(e);
    Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Sai thông tin đăng kí');
  }
}

Future sendOtp (String phone) async {
  var res = await dio.post(Api.convertURL(Api.sendOtp), data: {
"phone": phone,
});
return res;
}

Future<Response> checkOtp (String phone, String code) async {
You, last month ⚫ ud
var res = await dio.post(Api.convertURL(Api.checkOtp), data: {"phone": phone, 'code': code});
return res;



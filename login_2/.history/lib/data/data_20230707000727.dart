// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// Future<void> fetchData(String email) async {
//   try {
//     final url = 'https://stg.utrace.net/users/$email';
//     final response = await dio.get(url);
//     if (response.statusCode == 200) {
//       final data = response.data;
//       print(data);
//     } else {
//       print('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }

// Future<void> checkOtp(String email, String otp) async {
//   try {
//     var res = await accountRepository.checkOtp(email, otp);
//     if (res != null && res.statusCode == 200) {
//       await signup();
//     } else {
//       Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Mã OTP không đúng');
//     }
//   } catch (e) {
//     print('Error: $e');
//     Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Có lỗi xảy ra');
//   }
// }

// Future<void> sendOtp(String email, TypeOTP typeOTP, {String? password, String? name}) async {
//   try {
//     var res = await accountRepository.sendOtp(email);
//     if (res != null && res.statusCode == 200) {
//       Navigator.push(
//         NavigateKeys().navigationKey.currentContext!,
//         MaterialPageRoute(builder: (context) => ConfirmOtp(
//           typeOTP: typeOTP,
//           email: email,
//           password: password ?? '',
//         )),
//       );
//     } else {
//       Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Sai thông tin');
//     }
//   } catch (e) {
//     print('Error: $e');
//     Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Có lỗi xảy ra');
//   }
// }

// Future<void> signup() async {
//   try {
//     updateFormSignup(acceptDate: Utils().convertDateToString(DateTime.now()), code: SignupModel.email, noteActive: '');
//     var res = await accountRepository.signup(SignupModel);
//     if (res != null && res.data is String) {
//       Navigator.pushNamedAndRemoveUntil(NavigateKeys().navigationKey.currentContext!, AppRouter.loginScreen, (route) => false);
//       Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Đăng kí thành công');
//     }
//   } catch (e) {
//     print(e);
//     Common.showSnackBar(NavigateKeys().navigationKey.currentContext!, 'Sai thông tin đăng kí');
//   }
// }

// Future sendOtp (String email) async {
//   var res = await dio.post(Api.convertURL(Api.sendOtp), data: {
// "email": email,
// });
// return res;
// }

// Future<Response> checkOtp (String email, String otp) async {
// var res = await dio.post(Api.convertURL(Api.checkOtp), data: {"email": email, 'otp': otp});
// return res;
// }

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  Dio dio = Dio();

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showOtpField = false;
  bool showPasswordField = false;

  String otpMessage = '';
  String passwordMessage = '';

  void sendOtp() async {
    try {
      String email = emailController.text;
      var response =
          await Dio().post('https://stg.utrace.net/users/send_otp', data: {
        'email': email,
      });
      if (response.statusCode == 200) {
        setState(() {
          showOtpField = true;
          otpMessage = 'Mã OTP đã được gửi đến email của bạn';
        });
      } else {
        setState(() {
          otpMessage = 'Gửi mã OTP không thành công';
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        otpMessage = 'Có lỗi xảy ra';
      });
    }
  }

  void verifyOtp() async {
    try {
      String email = emailController.text;
      String otp = otpController.text;
      var response =
          await Dio().post('https://stg.utrace.net/users/verify_otp', data: {
        'email': email,
        'otp': otp,
      });
      if (response.statusCode == 200) {
        setState(() {
          showPasswordField = true;
          passwordMessage = 'Mã OTP đã được xác minh';
        });
      } else {
        setState(() {
          passwordMessage = 'Mã OTP không đúng';
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        passwordMessage = 'Có lỗi xảy ra';
      });
    }
  }

  void signUp() async {
    try {
      String email = emailController.text;
      String password = passwordController.text;
      var response =
          await Dio().post('https://stg.utrace.net/users/signup', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      } else {
        setState(() {
          passwordMessage = 'Đăng ký không thành công';
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        passwordMessage = 'Có lỗi xảy ra';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Ký'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: sendOtp,
              child: const Text('Gửi mã OTP'),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: showOtpField,
              child: Column(
                children: [
                  TextField(
                    controller: otpController,
                    decoration: const InputDecoration(labelText: 'OTP'),
                  ),
                  ElevatedButton(
                    onPressed: verifyOtp,
                    child: const Text('Xác minh OTP'),
                  ),
                  Text(otpMessage),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: showPasswordField,
              child: Column(
                children: [
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Mật khẩu'),
                  ),
                  ElevatedButton(
                    onPressed: signUp,
                    child: const Text('Đăng Ký'),
                  ),
                  Text(passwordMessage),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

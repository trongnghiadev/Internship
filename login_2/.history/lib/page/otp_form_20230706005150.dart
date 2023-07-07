import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/page/signup_page.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatefulWidget {
  // static const routeName = "/otppage";
  // final GlobalKey<NavigatorState> navigatorKey;

  // OtpPage({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpFieldController otpController = OtpFieldController();

  // void verifyOTP(BuildContext context) {
  //   var text;
  //   String otp = otpController.getValue();
  //   if (otp.length == 6 && otp == '123456') {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => SignupPage(),
  //       ),
  //     );
  //   } else {
  //     //Mã OTP sai
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('Thông báo'),
  //           content: const Text('OTP không hợp lệ'),
  //           actions: <Widget>[
  //             TextButton(
  //               child: const Text('OK'),
  //               onPressed: () {
  //                 Navigator.of(context).pop(); // Đóng dialog
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: dColorBG,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/logo--footer 2.png',
                height: 60,
              ),
              const SizedBox(height: 20),
              const Text(
                'Nhập mã xác minh',
                style: TextStyle(
                  color: dColorMain,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Để xác minh email là của bạn, nhập mã gồm 6 chữ số vừa được gửi đến',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: dColorText),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: OTPTextField(
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 80,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignupPage(), // Thay NewPage() bằng màn hình muốn chuyển đến
                    ),
                  );
                },
                child: const Text(
                  'Gửi lại mã',
                  style: TextStyle(
                    color: dColorMain,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF11A44A), // Màu nền của nút
                  padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 100), // Kích thước padding của nút
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Độ cong viền của nút
                  ),
                ),

                //Chuyển trang
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },

                child: Text(
                  'Tiếp tục',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

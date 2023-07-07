import 'package:flutter/material.dart';
import 'package:login_2/page/signup_page.dart';
import '../config/const.dart';

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  int loginAttempts = 0;
  bool warning = false;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void login() {
    if (warning) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AnimatedContainer(
            alignment: Alignment.bottomCenter,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: EdgeInsets.only(bottom: warning ? 0 : -100),
            child: AlertDialog(
              title: const Center(
                child: Text(
                  'Thông báo',
                  style: TextStyle(color: dColorMain),
                ),
              ),
              content: const Text(
                'Email hoặc mật khẩu bị sai. Tài khoản của Quý khách sẽ bị giới hạn sau 6h nếu nhập sai 5 lần liên tiếp!',
              ),
              actions: <Widget>[
                Container(
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: dColorMain,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    child: const Text(
                      'Đóng',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Đóng dialog
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      loginAttempts++;

      if (loginAttempts >= 3) {
        setState(() {
          warning = true;
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpPage(navigatorKey: navigatorKey),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: login,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: dColorMain,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Tiếp Tục',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

//Xử lý OTP
class OtpPage extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<NavigatorState> navigatorKey; // Thêm navigatorKey

  OtpPage({Key? key, required this.navigatorKey})
      : super(key: key); // Thêm tham số và khởi tạo

  void verifyOTP(BuildContext context) {
    // Xử lý xác thực OTP ở đây
    String otp = otpController.text;
    if (otp == '1234') {
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => SignupPage(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thông báo'),
            content: const Text('OTP không hợp lệ'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: otpController,
              decoration: const InputDecoration(
                labelText: 'OTP',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                verifyOTP(context); // Truyền context vào hàm verifyOTP
              },
              child: const Text('Xác thực'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_2/screens/otp_screen.dart';
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            OtpScreen(), // Thay NewPage() bằng màn hình muốn chuyển đến
      ),
    );
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

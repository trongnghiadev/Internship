import 'package:flutter/material.dart';
import 'package:login_2/screens/login_screen.dart';
import '../config/const.dart';

class MyButtonSignUp extends StatefulWidget {
  const MyButtonSignUp({Key? key}) : super(key: key);

  @override
  State<MyButtonSignUp> createState() => _MyButtonSignUpState();
}

class _MyButtonSignUpState extends State<MyButtonSignUp> {
  int loginAttempts = 0;
  bool warning = false;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const LoginScreen(), // Thay NewPage() bằng màn hình muốn chuyển đến
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
          color: AppColors.dColorMain,
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

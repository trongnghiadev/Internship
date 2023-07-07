import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/widgets/login_text.dart';
import 'package:login_2/widgets/signup_button.dart';

class SignupPage extends StatelessWidget {
  // static const routeName = "/signuppage";
  SignupPage({Key? key});

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: dColorBG,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),

              //logo
              Image.asset(
                'assets/image/logo--footer 2.png',
                height: 60,
              ),

              const SizedBox(
                height: 20,
              ),

              //Đăng Ký
              const Text(
                'Đăng Ký',
                style: TextStyle(color: dColorMain, fontSize: 25),
              ),
              const SizedBox(
                height: 15,
              ),

              //Nhắc nhở
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      'Thiết lập mật khẩu',
                      style: TextStyle(color: dColorText),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              //Login
              MyTextField(
                controller: passwordController,
                hintText: 'Nhập mật khẩu',
                obscureText: true,
                prefixIcon: const Icon(Icons.lock),
              ),

              const SizedBox(
                height: 20,
              ),

              MyTextField(
                controller: passwordController,
                hintText: 'Xác nhận lại mật khẩu',
                obscureText: true,
                prefixIcon: const Icon(Icons.lock),
              ),

              const SizedBox(
                height: 100,
              ),

              const MyButtonSignUp(),

              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

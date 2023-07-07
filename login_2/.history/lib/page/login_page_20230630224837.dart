import 'package:flutter/material.dart';
import 'package:login_2/components/button_bottom.dart';
import 'package:login_2/components/button_login.dart';
import 'package:login_2/components/textfild_login.dart';
import 'package:login_2/config/const.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: dColorBG,
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),

            //Logo
            Image.asset(
              'assets/image/logo--footer 2.png',
              height: 60,
            ),
            const SizedBox(
              height: 20,
            ),

            //Welcome
            const Text(
              'Xin chào',
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
                    'Nhập email để đăng ký hoặc đăng nhập',
                    style: TextStyle(color: dColorText),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            //login
            MyTextField(
              controller: usernameController,
              hintText: 'Vui lòng nhập email',
              obscureText: false,
              prefixIcon: const Icon(Icons.person),
            ),

            const SizedBox(
              height: 40,
            ),
            const MyButton(),

            const SizedBox(
              height: 40,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(255, 91, 90, 90),
                    ),
                  ),
                  Text(
                    'Hoặc',
                    style: TextStyle(),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(255, 91, 90, 90),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButonBottom(
                    imagePath: 'assets/image/Zalo.png',
                    colors: Colors.white,
                    colorText: Colors.blue,
                    text: 'Đăng nhập bằng Zalo',
                    onPressed: () {
                      print("Zalo");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButonBottom(
                    imagePath: 'assets/image/gg.png',
                    colors: Colors.white,
                    colorText: Colors.black,
                    text: 'Đăng nhập bằng Google',
                    onPressed: () {
    print("Zalo");
  },
                  SizedBox(
                    height: 20,
                  ),
                  ButonBottom(
                    imagePath: 'assets/image/fb.png',
                    colors: Color(0xff1877F2),
                    colorText: Colors.white,
                    text: 'Đăng nhập bằng Facebook',
                    onTap: () {
                      print("Google");
                    },
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

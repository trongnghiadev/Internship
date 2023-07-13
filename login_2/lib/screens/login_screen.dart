import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/config/stringtext.dart';
import 'package:login_2/data/checkExistEmail.dart';
import 'package:login_2/data/register.dart';
import 'package:login_2/screens/otp_screen.dart';
import 'package:login_2/widgets/button_bottom.dart';
import 'package:login_2/utils/email_regex.dart';

import 'loginwithpass.dart';

class LoginScreen extends StatefulWidget {
  // static const routeName = "/LoginScreen";
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void handleSubmit(BuildContext context) {
    final email = _emailController.text;
    checkExistEmail().fetchData(email).then((existEmailStatus) {
      if (existEmailStatus != null) {
        if (existEmailStatus == 'false') {
          RegisterData().fetchData(email).then((registerStatus) {
            if (registerStatus != null) {
              if (registerStatus == 'true') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen(
                      email: email,
                    ),
                  ),
                );
              } else {
                print('khong thanh cong');
              }
            }
          });
        } else if (existEmailStatus == 'true') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PassScreen(email: email),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: dColorBG,
            body: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 50,
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
                    textHello,
                    style: TextStyle(color: AppColors.dColorMain, fontSize: 25),
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
                          textLogin,
                          style: TextStyle(color: dColorText),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: textEmail,
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return textEmailAgain;
                          }
                          if (!EmailRegex.emailPattern.hasMatch(value)) {
                            return textABC;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        onTap: () {
                          if (_formKey.currentState?.validate() == true) {
                            handleSubmit(context);
                          }
                        },
                        text: textButton,
                      ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: ButtonBottom(
                                imagePath: 'assets/image/Zalo.png',
                                colors: Colors.white,
                                colorText: Colors.blue,
                                text: 'Đăng nhập bằng Zalo',
                                onTap: () {
                                  print("Zalo");
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ButtonBottom(
                              imagePath: 'assets/image/gg.png',
                              colors: Colors.white,
                              colorText: Colors.black,
                              text: 'Đăng nhập bằng Google',
                              onTap: () {
                                print("Facebook");
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ButtonBottom(
                              imagePath: 'assets/image/fb.png',
                              colors: const Color(0xff1877F2),
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
                ]),
              ),
            )));
  }
}

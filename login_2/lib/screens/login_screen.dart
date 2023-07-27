import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/config/icons.dart';
import 'package:login_2/config/stringtext.dart';
import 'package:login_2/data/check_exist_email.dart';
import 'package:login_2/data/register.dart';
import 'package:login_2/screens/otp_screen.dart';
import 'package:login_2/widgets/button_bottom.dart';
import 'package:login_2/utils/email_regex.dart';
import '../widgets/toast_message.dart';
import 'login_with_pass_screen.dart';

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
  bool isLoading = false;

  late FToast toast;

  @override
  void initState() {
    super.initState();
    toast = FToast();
    toast.init(context);
  }

  void handleSubmit(BuildContext context) {
    final email = _emailController.text;

      if (email == '' || email.isEmpty) {
        toast.showToast(
          child:
              const ToastMessage(message: textEmailAgain),
          gravity: ToastGravity.BOTTOM,
        );
        return;
      }
      if (!EmailRegex.emailPattern.hasMatch(email)) {
        toast.showToast(
          child: const ToastMessage(message: textABC),
          gravity: ToastGravity.BOTTOM,
        );
        return;
      }
      //set loading
      setState(() {
        isLoading = true;
      });
    CheckExistEmail().fetchData(email).then((existEmailStatus) {
      if (existEmailStatus != null) {
        if (existEmailStatus == 'false') {
          RegisterData().fetchData(email).then((registerStatus) {
            if (registerStatus != null) {
              if (registerStatus == 'true') {
                setState(() {
                  isLoading = false;
                });
                //Không xài được get to (xài trên máy thật không đăng nhập được)
                Get.off( () => OtpScreen(email: email));
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => OtpScreen(
                //       email: email,
                //     ),
                //   ),
                // );
              } else {
                print('khong thanh cong');
              }
            }
          });
        } else if (existEmailStatus == 'true') {
          setState(() {
            isLoading = false;
          });
          Get.off( () => PassScreen(email: email));

          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => PassScreen(email: email),
          //   ),
          // );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.dColorBG,
            body: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 50,
                  ),

                  //Logo
                  const LogoImage(),

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
                          style: TextStyle(color: AppColors.dColorText),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  Form(
                    key: _formKey,
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: textEmail,
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      //Hiển thị loading lên màng hình
                      if (isLoading == true)
                        const SizedBox(
                          height: 50,
                          width: 50,
                          child: LoadingIndicator(
                            indicatorType: Indicator.circleStrokeSpin,
                            strokeWidth: 2,
                          ),
                        ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                        onTap: () {
                          if (_formKey.currentState?.validate() == true) {
                            handleSubmit(context);
                          }
                        },
                        text: 'Tiếp tục',
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const SizedBox(
                        height: 30,
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
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Hoặc',
                                style: TextStyle(),
                              ),
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

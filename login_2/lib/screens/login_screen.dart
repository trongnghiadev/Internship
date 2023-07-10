import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/data.dart';
import 'package:login_2/screens/otp_screen.dart';
import 'package:login_2/widgets/button_bottom.dart';
import 'package:login_2/widgets/login_text.dart';

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

  final _passwordController = TextEditingController();
  bool passwordVisibility = false;

  
  void handleSubmit(BuildContext context) {
    final email = _emailController.text;
    OTPData().fetchData(email).then((OTPStatus) => {
          if (OTPStatus != null)
            {
              if (OTPStatus == 'false')
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(
                        email: email,
                      ),
                    ),
                  ),
                }
              else if (OTPStatus == 'true')
                {
                  setState(() {
                    passwordVisibility = true;
                  })
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
                'Xin chào',
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
                controller: _emailController,
                hintText: 'Vui lòng nhập email',
                obscureText: false,
                prefixIcon: const Icon(Icons.person),
              ),

              const SizedBox(
                height: 20,
              ),

              Visibility(
                visible: passwordVisibility,
                child: MyTextField(
                  controller: _passwordController,
                  hintText: 'Nhập mật khẩu',
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),

              const SizedBox(
                height: 40,
              ),

              CustomButton(
                  onTap: () {
                    handleSubmit(context);
                  },
                  text: 'Submit'),

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
                padding: EdgeInsets.symmetric(horizontal: 30),
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
      ),
    );
  }
}

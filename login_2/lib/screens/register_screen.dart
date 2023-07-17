import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/screens/login_screen.dart';
import 'package:login_2/widgets/button_bottom.dart';
import 'package:login_2/data/set_new_pass.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool passwordsMatch = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void checkPasswordsMatch() {
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    setState(() {
      passwordsMatch = password == confirmPassword;
    });
  }

  void handleSubmit(BuildContext context) {
    final String password = passwordController.text;

    if (password.isEmpty) {
      // Password is empty

      return;
    }

    // Passwords match, continue with registration logic
  }

  @override
  Widget build(BuildContext context) {
    final String email = widget.email;

    return SafeArea(
      child: Scaffold(
        backgroundColor: dColorBG,
        body: SingleChildScrollView(
          reverse: true,
          child: Center(
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
                  style: TextStyle(color: AppColors.dColorMain, fontSize: 25),
                ),
                const SizedBox(
                  height: 15,
                ),

                //Nhắc nhở
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      const Text(
                        'Thiết lập mật khẩu ',
                        style: TextStyle(color: dColorText),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                          color: dColorText,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                //Login
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Vui lòng nhập mật khẩu',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    checkPasswordsMatch();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'Xác nhận mật khẩu',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    checkPasswordsMatch();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng không để trống';
                    }
                    if (value != passwordController.text) {
                      return 'Mật khẩu không khớp';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 100,
                ),

                // Button "Tiếp tục"
                if (passwordsMatch || passwordController.text.isNotEmpty)
                  CustomButton(
                    onTap: () {
                      SetNewPass()
                          .fetchData(email, passwordController.text)
                          .then((status) {
                        if (status != null) {
                          if (status == 'true') {
                            Get.off(const LoginScreen());
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const LoginScreen(),
                            //   ),
                            // );
                          }
                        }
                      });
                    },
                    text: 'Tiếp tục',
                  ),

                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

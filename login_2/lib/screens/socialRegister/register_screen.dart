import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/author/set_new_pass.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';

import '../../config/icons.dart';
import '../../widgets/toast_message.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;
  bool passwordsMatch = false;
  late FToast toast;

  @override
  void initState() {
    super.initState();
    toast = FToast();
    toast.init(context);
  }

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
      // TODO: Display error message or handle validation error
      return;
    }

    // Passwords match, continue with registration logic
  }

  @override
  Widget build(BuildContext context) {
    final String email = widget.email;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.dColorBG,
        resizeToAvoidBottomInset: true,
        body: ListView(children: [
          Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
                const SizedBox(
                  height: 100,
                ),

                //logo
                const LogoImage(),

                const SizedBox(
                  height: 20,
                ),

                //Đăng Ký
                const Text(
                  'Đăng Ký',
                  style: TextStyle(color: AppColors.dColorMain, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),

                //Nhắc nhở
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      const Text(
                        'Thiết lập mật khẩu ',
                        style: TextStyle(color: AppColors.dColorText),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                          color: AppColors.dColorText,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 36,
                ),

                //Login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Vui lòng nhập mật khẩu',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordVisible1 = !isPasswordVisible1;
                          });
                        },
                        child: Icon(
                          isPasswordVisible1
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: !isPasswordVisible1,
                    onChanged: (value) {
                      checkPasswordsMatch();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập text';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(
                  height: 24,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Xác nhận mật khẩu',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordVisible2 = !isPasswordVisible2;
                          });
                        },
                        child: Icon(
                          isPasswordVisible2
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: !isPasswordVisible2,
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
                            toast.showToast(
                              child: ToastMessage(
                                message: 'Tạo tài khoản thành công',
                                icon: Icons.check_circle_sharp,
                                // Red X icon
                                backgroundColor: Colors.green[300],
                                // Light red background
                                textColor: Colors.white, // Red text color
                              ),
                              gravity: ToastGravity.BOTTOM,
                            );
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
        ]),
      ),
    );
  }
}

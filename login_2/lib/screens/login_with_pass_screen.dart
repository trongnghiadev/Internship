import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/screens/login_screen.dart';
import 'package:login_2/store/storecontroller.dart';
import 'package:login_2/widgets/button_bottom.dart';
import 'package:login_2/data/login.dart';
import 'package:get/get.dart';
import 'package:login_2/widgets/toast_message.dart';
import '../config/icons.dart';
import 'main_screen.dart';

class PassScreen extends StatefulWidget {
  PassScreen({Key? key, required this.email}) : super(key: key);

  final String email;
  final storeController = Get.find<StoreController>();

  @override
  State<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  final passwordController = TextEditingController();
  late FToast toast;
  bool isPasswordVisible = false;
  @override
  void initState() {
    super.initState();
    toast = FToast();
    toast.init(context);
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void checkPasswordsMatch() {}

  @override
  Widget build(BuildContext context) {
    final String email = widget.email;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.dColorBG2,
        body: SingleChildScrollView(
          // Wrap the content with SingleChildScrollView
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.to(const LoginScreen());
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
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
                  'Đăng Nhập',
                  style: TextStyle(color: AppColors.dColorMain, fontSize: 25),
                ),
                const SizedBox(
                  height: 15,
                ),

                const SizedBox(
                  height: 40,
                ),

                //Login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Vui lòng nhập mật khẩu',
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: !isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(
                  height: 70,
                ),

                CustomButton(
                  onTap: () {
                    Login()
                        .fetchData(email, passwordController.text)
                        .then((value) {
                      if (value != null) {
                        widget.storeController.updateUser(value);
                        Get.offAll(() => MainScreen());
                      } else {
                        toast.showToast(
                          child: const ToastMessage(
                              message: 'Mật khẩu không chính xác'),
                          gravity: ToastGravity.BOTTOM,
                        );
                      }
                    });
                  },
                  text: 'Đăng nhập',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/login.dart';
import 'package:login_2/models/user_model.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:login_2/store/storecontroller.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';
import 'package:login_2/widgets/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/icons.dart';
import '../main/main_screen.dart';

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

  void saveLoggedInStatus(User user) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập
    prefs.setInt('user_id', user.id ?? 0);
    prefs.setString('user_email', user.email ?? '');
    prefs.setBool('user_emailVerified', user.emailVerified ?? false);
    prefs.setString('user_fullname', user.fullname ?? '');
    prefs.setString('user_phone', user.phone ?? '');
    Get.offAll(() => MainScreen());
  }

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
                        saveLoggedInStatus(value);
                      } else {
                        toast.showToast(
                          child: ToastMessage(
                            message: 'Nhập sai mật khẩu',
                            icon: Icons.close,
                            // Red X icon
                            backgroundColor: Colors.red.shade300,
                            // Light red background
                            textColor: Colors.white, // Red text color
                          ),
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

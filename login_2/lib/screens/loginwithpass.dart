import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/models/userModel.dart';
import 'package:login_2/store/storecontroller.dart';
import 'package:login_2/widgets/button_bottom.dart';
import 'package:login_2/data/login.dart';
import 'package:get/get.dart';
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
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Vui lòng nhập mật khẩu',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),

              CustomButton(
                onTap: () {
                  Login()
                      .fetchData(email, passwordController.text)
                      .then((value) {
                    print(value);
                    if (value != null) {
                      widget.storeController.updateUser(value);
                      Get.offAll(() => MainScreen());
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MainScreen()),
                      // );
                    }
                  });
                },
                text: 'Đăng nhập',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

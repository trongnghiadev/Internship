import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_2/screens/main_screen.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../store/storecontroller.dart';
import '../widgets/buttons/button_bottom.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen.myAccount({super.key});

  Future<void> clearSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // Màu nền xanh lá cho toàn bộ trang giao diện
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.to(() => MainScreen());
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/image/logo--footer 2.png'), // Đặt đường dẫn đến hình ảnh của bạn tại đây
                  ),
                  const SizedBox(height: 36),
                  Text(
                    storeController.storeUser.value.email ?? '',
                    // Thay đổi thành tên người dùng của bạn
                    style: const TextStyle(
                      color: Colors.black87, // Màu chữ trắng
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Xử lý sự kiện khi nhấn nút Chỉnh sửa tài khoản
                      print('Chỉnh sửa tài khoản');
                    },
                    label: const Text('Chỉnh Sửa tài khoản'),
                    style: ElevatedButton.styleFrom(
                        // primary: Colors.white, // Màu nền nút là trắng
                        // onPrimary:
                        // Colors.lightGreen, // Màu chữ của nút là xanh lá
                        ),
                    icon: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90),
            CustomButton(
              onTap: () {
                clearSavedState();
                Get.offAll(() => const LoginScreen());
              },
              text: 'Đăng Xuất',
            )
          ],
        ),
      ),
    );
  }
}

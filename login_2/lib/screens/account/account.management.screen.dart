import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/screens/account/edit_account_screen.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../store/storecontroller.dart';

class AccountManagement extends StatefulWidget {
  AccountManagement({super.key});

  final storeController = Get.find<StoreController>();

  @override
  State<AccountManagement> createState() => _AccountManagementState();
}

@override
class _AccountManagementState extends State<AccountManagement> {
  Future<void> clearSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Widget buildIconContainer(IconData icon, String text, Function()? onTap) {
    return Container(
      width: double.infinity,
      height: 40.0,
      decoration: const BoxDecoration(
        color: AppColors.dColorButtonContainer,
        border: Border(
          bottom: BorderSide(
            color: AppColors.dColorText2,
            width: 1.0,
          ),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(
                icon,
                size: 15.0,
              ),
            ),
            const SizedBox(width: 10.0),
            Text(
              text,
              style: const TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.dColorMain,
                  ),
                  child: Center(
                    child: ClipOval(
                      child: Container(
                        width: 110.0,
                        height: 110.0,
                        color: Colors.white,
                        child: Image.asset(
                          'assets/image/logo--footer 2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${widget.storeController.storeUser.value.email}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Get.to(EditAccount()),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chỉnh sửa tài khoản',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.keyboard_arrow_right_rounded)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                buildIconContainer(Icons.help_outline, 'Hỗ trợ', () {
                  // Xử lý sự kiện khi người dùng bấm vào 'Hỗ trợ'
                }),
                buildIconContainer(Icons.policy, 'Chính sách và thông tin', () {
                  // Xử lý sự kiện khi người dùng bấm vào 'Chính sách và thông tin'
                }),
                buildIconContainer(Icons.settings, 'Cài đặt', () {
                  // Xử lý sự kiện khi người dùng bấm vào 'Cài đặt'
                }),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onTap: () {
                    clearSavedState();
                    Get.offAll(() => const LoginScreen());
                  },
                  text: 'Đăng Xuất',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

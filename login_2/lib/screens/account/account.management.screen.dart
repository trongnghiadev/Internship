import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/screens/account/edit_account_screen.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountManagement extends StatefulWidget {
  const AccountManagement({super.key});

  @override
  State<AccountManagement> createState() => _AccountManagementState();
}

@override
class _AccountManagementState extends State<AccountManagement> {
  Future<void> clearSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
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
                          'assets/image/logo--footer 2.png', //
                          fit: BoxFit.cover, //
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Hiếu Nghĩa',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Get.to(const EditAccount()),
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
                Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: AppColors.dColorButtonContainer,
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.dColorText2,
                        width: 1.0, //
                      ),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 60.0),
                  child: const Text(
                    'Hỗ trợ',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: AppColors.dColorButtonContainer,
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.dColorText2,
                        width: 1.0, //
                      ),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 60.0),
                  child: const Text(
                    'Chính sách và thông tin',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: AppColors.dColorButtonContainer,
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.dColorText2,
                        width: 1.0, //
                      ),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 60.0),
                  child: const Text(
                    'Cài đặt',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
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

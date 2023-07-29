import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:login_2/widgets/layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> nextScreen() async {
    //set thoi gian hien man hinh
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  void initState() {
    super.initState();
    nextScreen();
    loadSavedState();
  }

  //Shared_Preferences
  void loadSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Kiểm tra trạng thái đăng nhập và chuyển hướng đến màn hình chính nếu đã đăng nhập
      int? isLoggedIn = prefs.getInt('userId');
      if (isLoggedIn != null) {
        Get.off(() => const Layout()); // Điều hướng đến trang chủ (MainScreen)
      } else {
        Get.offAll(() => const LoginScreen(), transition: Transition.native);
      }
      // ... Cập nhật các trạng thái khác tương tự (nếu có) ...
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Colors.white, Colors.white, Color(0xFFD5F2C7)],
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                        image: AssetImage('assets/image/logo--footer 2.png'),
                        width: 120)
                    .animate()
                    .fade()
                    .slideY(curve: Curves.easeIn),
                const Text(
                  'UTRACE',
                  style: TextStyle(
                    color: Color(0xFF064C15),
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.50,
                  ),
                ).animate().fade(),
              ],
            )),
          ),
        ),
        resizeToAvoidBottomInset: true);
  }
}

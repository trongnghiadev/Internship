import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: dColorBG,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/image/logo--footer 2.png',
                height: 60,
              ),
              const SizedBox(height: 20),
              // Tiêu đề
              const Text(
                'Nhập mã xác minh',
                style: TextStyle(
                  color: dColorMain,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Lời nhắc nhở
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Để xác minh email là của bạn, nhập mã gồm 6 chữ số vừa được gửi đến',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: dColorText),
                ),
              ),
              const SizedBox(height: 30),
              // Mã số hàng ngang
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 6; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: dColorText,
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '0', // Thay đổi giá trị tương ứng với mã số
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: dColorText2,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              // Đoạn chữ "Gửi lại mã"
              GestureDetector(
                onTap: () {
                  // Xử lý sự kiện khi người dùng nhấn "Gửi lại mã"
                },
                child: const Text(
                  'Gửi lại mã',
                  style: TextStyle(
                    color: dColorMain,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
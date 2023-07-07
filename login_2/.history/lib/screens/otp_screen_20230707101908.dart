import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/screens/Signup_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController email = TextEditingController();
  EmailOTP myauth = EmailOTP();

  Future<bool> sendOTP() async {
    myauth.setConfig(
      appEmail: "me@rohitchouhan.com",
      appName: "Email OTP",
      userEmail: email.text,
      otpLength: 6,
      otpType: OTPType.digitsOnly,
    );
    return await myauth.sendOTP();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: dColorBG,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/logo--footer 2.png',
                height: 60,
              ),
              const SizedBox(height: 20),
              const Text(
                'Nhập mã xác minh',
                style: TextStyle(
                  color: dColorMain,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Để xác minh email là của bạn, nhập mã gồm 6 chữ số vừa được gửi đến',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: dColorText),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: OTPTextField(
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 80,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  bool otpSent = await sendOTP();
                  if (otpSent) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("OTP has been sent"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Oops, OTP send failed"),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Gửi lại mã',
                  style: TextStyle(
                    color: dColorMain,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF11A44A), // Màu nền của nút
                  padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 130), // Kích thước padding của nút
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Độ cong viền của nút
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  );
                },
                child: Text(
                  'Tiếp tục',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

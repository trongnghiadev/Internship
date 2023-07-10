import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/data.dart';
import 'package:login_2/screens/Signup_screen.dart';
import 'package:login_2/widgets/button_bottom.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  // static const routeName = "/OtpScreen";
  // final GlobalKey<NavigatorState> navigatorKey;

  const OtpScreen({Key? key, required this.email}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpFieldController otpController = OtpFieldController();
  String otpCode = '';

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
                  color: AppColors.dColorMain,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Để xác minh, nhập mã gồm 6 chữ số vừa được gửi đến ${widget.email}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: dColorText),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 50,
                  onChanged: (value) {
                    otpCode = value;
                  },
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    OTPData().checkOTP(widget.email, pin);
                  },
                ),
              ),
              const SizedBox(height: 20),
              //   CustomButton(onTap: () {}, text: 'Tiếp tục'),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignupScreen(), // Thay NewPage() bằng màn hình muốn chuyển đến
                    ),
                  );
                },
                child: const Text(
                  'Gửi lại mã',
                  style: TextStyle(
                    color: AppColors.dColorMain,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              CustomButton(
                  onTap: () {
                    OTPData().checkOTP(widget.email, otpCode);
                  },
                  text: 'Tiếp tục')
            ],
          ),
        ),
      ),
    );
  }
}

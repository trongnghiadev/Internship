import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/resend_otp.dart';
import 'package:login_2/screens/socialRegister/register_screen.dart';
import 'package:login_2/widgets/coutdown_button.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../config/icons.dart';
import '../../data/author/check_otp.dart';
import '../../widgets/toast_message.dart';

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

  late FToast toast;

  //Khởi tạo lần đầu mỗi lần vào trang này
  @override
  void initState() {
    super.initState();
    toast = FToast(); // 2 dòng cuối khởi tạo để hiện toast
    toast.init(context);
  }

  bool otpMatch = false;

  void handleResendOTP() {
    ResendOtp().fetchData(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    final email = widget.email;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.dColorBG,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoImage(),
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Để xác minh, nhập mã gồm 6 chữ số vừa được gửi đến ${widget.email}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.dColorText),
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
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onCompleted: (pin) {
                    //Xử lý tắt bàn phím khi người dùng nhập xong mã OTP
                    FocusScope.of(context).unfocus();
                    //Xử lý kiểm tra OTP
                    CheckOtp()
                        .fetchData(widget.email, pin)
                        .then((checkOtpStatus) {
                      if (checkOtpStatus != null) {
                        if (checkOtpStatus == "true") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(
                                email: email,
                              ),
                            ),
                          );
                        } else {
                          toast.showToast(
                            child: ToastMessage(
                              message: 'Mã OTP không chính xác',
                              icon: Icons.close_rounded,
                              // Red X icon
                              backgroundColor: Colors.red.shade300,
                              // Light red background
                              textColor: Colors.white, // Red text color
                            ),
                            gravity: ToastGravity.BOTTOM,
                          );
                        }
                      }
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 100,
              ),
              CountdownWidget(
                duration: 59,
                onResendOTP: handleResendOTP,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

// đổi toàn bộ _CountdownWidgetState thành CountdownWidgetState
class CountdownWidget extends StatefulWidget {
  final int duration;
  final VoidCallback onResendOTP;

  const CountdownWidget({
    Key? key,
    required this.duration,
    required this.onResendOTP,
  }) : super(key: key);

  @override
  CountdownWidgetState createState() =>
      CountdownWidgetState(); // Updated return type
}

class CountdownWidgetState extends State<CountdownWidget> {
  // Removed underscore prefix
  int _countdownValue = 0;
  late Timer _countdownTimer;

  @override
  void initState() {
    super.initState();
    _countdownValue = widget.duration;
    startCountdown();
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  void startCountdown() {
    const oneSec = Duration(seconds: 1);
    _countdownTimer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_countdownValue <= 0) {
          timer.cancel();
        } else {
          _countdownValue--;
        }
      });
    });
  }

  String formatCountdown(int seconds) {
    String minutesStr = (seconds ~/ 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  void handleResendOTP() {
    widget.onResendOTP(); // Call the callback function to handle resend OTP
    setState(() {
      _countdownValue = widget.duration; // Reset the countdown value
      startCountdown(); // Start the countdown again
    });
  }

  @override
  Widget build(BuildContext context) {
    return _countdownValue > 0
        ? Text(
            formatCountdown(_countdownValue),
            style: const TextStyle(fontSize: 40),
          )
        : ElevatedButton(
            onPressed: handleResendOTP,
            style: ElevatedButton.styleFrom(
              //Thay primary thành backgroundColor
              backgroundColor: const Color(0xff11A44A),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Gửi lại mã xác nhận'),
          );
  }
}

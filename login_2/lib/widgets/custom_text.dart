import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? buttonColor;
  final double horizontalPadding;
  final double verticalPadding;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.buttonColor,
    this.horizontalPadding = 0, //Đặt mặc định là 0
    this.verticalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    );
  }
}

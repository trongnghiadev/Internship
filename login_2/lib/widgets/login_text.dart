import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? prefixIcon;

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          //Thêm icon mong muốn
          prefixIcon: prefixIcon,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 174, 170, 170)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.dColorMain),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.dColorMain),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

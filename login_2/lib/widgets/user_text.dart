import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';

class TextFieldUser extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const TextFieldUser({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Color.fromARGB(255, 174, 170, 170)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.dButoonInActive),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.dButoonInActive),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.person_2_outlined,
            color: Color.fromARGB(255, 121, 120, 120),
          ),
          hintText: 'Vui lòng nhập email',
          hintStyle: const TextStyle(color: Color.fromARGB(255, 174, 170, 170)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: dColorMain),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: dColorMain),
          ),
        ),
      ),
    );
  }
}

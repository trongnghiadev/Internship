import 'package:flutter/material.dart';

class ButtonBottom extends StatelessWidget {
  final String imagePath;
  final colors;
  final text;
  final colorText;
  final void Function() onTap;

  // final controller;
  // final String Text;

  const ButtonBottom({
    super.key,
    required this.imagePath,
    required this.colors,
    required this.colorText,
    required this.text,
    required this.onTap,
    //  required this.controller,required this.Text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: colors,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(255, 175, 173, 173),
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Color.fromARGB(255, 245, 244, 244),
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15,
                  spreadRadius: 1.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  text,
                  style: TextStyle(color: colorText),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
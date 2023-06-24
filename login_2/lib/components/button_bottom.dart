import 'package:flutter/material.dart';

class ButonBottom extends StatelessWidget {
  final String imagePath;
  final colors;
  final text;
  final colorText;

  // final controller;
  // final String Text;

  const ButonBottom({
    super.key,
    required this.imagePath,
    required this.colors,
    required this.colorText,
    required this.text,

    //  required this.controller,required this.Text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Center(
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

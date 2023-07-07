import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/widgets/custom_text.dart';

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

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;

  const CustomButton(
      {super.key, this.width, required this.onTap, required this.text});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          width: widget.width ?? 100,
          height: 46,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: AppColors.buttonColor,
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
            child: CustomText(
              text: widget.text,
            ),
          )),
    );
  }
}

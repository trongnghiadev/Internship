import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';

class ToastMessage extends StatelessWidget {
  const ToastMessage({super.key, required this.message});

  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: dButoonInActive,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 12.0,
          ),
          Wrap(children: [
            Text(
              message,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.dColorTF),
            ),
          ]),
        ],
      ),
    );
  }
}

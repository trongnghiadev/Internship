import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';

class ToastMessage extends StatelessWidget {
  const ToastMessage({
    Key? key,
    required this.message,
    this.icon,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final String message;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    const defaultBackgroundColor = AppColors.dButoonInActive;
    const defaultTextColor = AppColors.dColorTF;
    // const defaultIcon = Icons.info; // You can set the default icon here

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor ?? defaultBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: textColor ?? defaultTextColor,
            ),
          if (icon != null) const SizedBox(width: 8),
          Flexible(
            child: Text(
              message,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor ?? defaultTextColor),
            ),
          ),
        ],
      ),
    );
  }
}

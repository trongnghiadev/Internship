import 'package:flutter/material.dart';

class ToastMessage extends StatelessWidget {
  const ToastMessage({
    super.key,
    required this.message,
    required this.backgroundColor, // Thêm final Color backgroundColor;
  });

  final String message;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: backgroundColor, // Sử dụng giá trị backgroundColor ở đây
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );
  }
}

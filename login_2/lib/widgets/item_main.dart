import 'package:flutter/material.dart';

class ItemMain extends StatelessWidget {
  final colorIt;
  final colorIc;
  final color;
  final icon;
  final String textName;
  const ItemMain(
      {super.key,
      required this.icon,
      required this.textName,
      required this.color,
      required this.colorIt,
      required this.colorIc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: colorIc,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              textName,
              style: TextStyle(color: colorIt, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

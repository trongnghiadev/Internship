import 'package:flutter/material.dart';
import 'package:login_2/components/bottom_navigation_bar.dart';
import 'package:login_2/page/info_page.dart';
import 'package:login_2/page/login_page.dart';
import 'package:login_2/page/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfoPage(),
    );
  }
}

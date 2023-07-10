import 'package:flutter/material.dart';
import 'package:login_2/screens/login_screen.dart';
import 'package:login_2/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const routeName = "/";
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home: MainScreen(),
    );
  }
}

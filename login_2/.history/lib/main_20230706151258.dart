import 'package:flutter/material.dart';
import 'package:login_2/home/home.dart';
import 'package:login_2/home/home_body.dart';
import 'package:login_2/screens/LoginScreen.dart';
import 'package:login_2/screens/MainScreen.dart';
import 'package:login_2/screens/OtpScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const routeName = "/";
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home: HomeScreen(),

      // Navigator.pushNamed(context, ProductPage.routeName,
    );
  }
}

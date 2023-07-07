import 'package:flutter/material.dart';
import 'package:login_2/home/home.dart';
import 'package:login_2/home/home_body.dart';
import 'package:login_2/screens/LoginScreen.dart';
import 'package:login_2/screens/OtpScreen.dart';
import 'package:login_2/page/signup_page.dart';

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
      // home: LoginPage(),
      home: HomePage(),

      // Navigator.pushNamed(context, ProductPage.routeName,
    );
  }
}

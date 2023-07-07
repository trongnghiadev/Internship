import 'package:flutter/material.dart';
import 'package:login_2/screens/MainScreen.dart';

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
      home: MainScreen(),

      // Navigator.pushNamed(context, ProductPage.routeName,
    );
  }
}

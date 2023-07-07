import 'package:flutter/material.dart';
import 'package:login_2/home/home_body.dart';
import 'package:login_2/page/otp_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeBody(),
    );
  }
}

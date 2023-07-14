import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_2/screens/login_screen.dart';
import 'package:login_2/store/storebinding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const routeName = "/";
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: StoreBinding(),
        // home: LoginScreen(),
        home: const LoginScreen());
  }
}

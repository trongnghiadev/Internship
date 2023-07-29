import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:login_2/store/storebinding.dart';
import 'package:login_2/store/storecontroller.dart';

void main() {
  Get.put(StoreController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const routeName = "/";

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: StoreBinding(),
      builder: FToastBuilder(),
      home: const LoginScreen(),
    );
  }
}

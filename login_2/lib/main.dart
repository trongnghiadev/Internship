import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_2/screens/infomember_screen.dart';
import 'package:login_2/screens/login_screen.dart';
import 'package:login_2/store/storebinding.dart';
import 'package:login_2/store/storecontroller.dart';

void main() {
  Get.put(StoreController());

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
        home: InfoMemberScreen());
  }
}

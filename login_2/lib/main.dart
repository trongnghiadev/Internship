import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:login_2/components/bottom_navigation_bar.dart';
import 'package:login_2/page/info_page.dart';
import 'package:login_2/page/login_page.dart';
import 'package:login_2/page/mainpage.dart';
=======
import 'package:login_2/screens/login_screen.dart';
>>>>>>> d6920c95ae48c993643aa5ee64edbf95e3e2eb4f

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
<<<<<<< HEAD
      home: InfoPage(),
=======
      // home: LoginScreen(),
      home: LoginScreen(),

      // Navigator.pushNamed(context, ProductPage.routeName,
>>>>>>> d6920c95ae48c993643aa5ee64edbf95e3e2eb4f
    );
  }
}

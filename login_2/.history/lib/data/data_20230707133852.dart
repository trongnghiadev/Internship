// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }

// class _MyScreenState extends State<MyScreen> {
//   String email = 'example@example.com';
//   String status = '';

//   Future<void> fetchData() async {
//     final url = 'https://stg.utrace.net/users/$email';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = response.body;
//       final json = jsonDecode(data);

//       setState(() {
//         status = json['status'];
//       });
//     } else {
//       setState(() {
//         status = '';
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Screen'),
//       ),
//       body: Center(
//         child: status == 'false'
//             ? ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context, 
//                   MaterialPageRoute (
//                     builder: (context) => OtpScreen(),
//                   ),
//                   );
//                 },
//                 child: Text('OKE'),
//               )
//             : Container(),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:login_2/screens/otp_screen.dart';

Future<void> fetchDate() async {
  try {
    final url ='https://stg.utrace.net/users/$email';
    final response = await http.get(Url.parse(url));
    String status = '';
  }

  if  (response.statusCode == 200)
  {
    final data = response.body;
    final json = jsonDecode(data);
    status = json['status'];

    if(status == 'false') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OtpScreen()
        ),
        );
    } else {
      print('Tai khoan da ton tai');
    }
  } catch (e) {
    print(e);
  }
}
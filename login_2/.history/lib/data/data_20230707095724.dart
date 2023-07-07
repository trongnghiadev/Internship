import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String email = 'example@example.com';
  bool status = false;

  Future<void> fetchData() async {
    final url = 'https://stg.utrace.net/users/$email';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = response.body;
      final json = jsonDecode(data);

      setState(() {
        status = json['status'];
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: Center(
        child: status
            ? ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút "OKE"
                },
                child: Text('OKE'),
              )
            : Container(),
      ),
    );
  }
}

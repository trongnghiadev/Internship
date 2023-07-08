import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _email = 'adam@gmail.com'; // Thay thế bằng địa chỉ email thực tế
  String _status = '';

  void fetchData() async {
    final response =
        await http.get('https://stg.utrace.net/users/$_email' as Uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _status = data['status'];
      });
    } else {
      setState(() {
        _status = '';
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
        title: Text('API Response'),
      ),
      body: Center(
        child: _status == 'false'
            ? ElevatedButton(
                onPressed: () {
                  // Xử lý khi nút được nhấn
                },
                child: Text('OKE'),
              )
            : SizedBox(), // Không hiển thị giao diện nếu trạng thái không phải 'false'
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Response Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

import 'package:flutter/material.dart';

class ManagerUser extends StatelessWidget {
  const ManagerUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin công ty"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text(
              'Thông tin công ty',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

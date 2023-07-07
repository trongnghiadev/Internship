import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF11A44B),
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [],
          ),
        ]),
      ),
    );
  }
}

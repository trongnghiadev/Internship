// ignore_for_file: prefer_const_constructors

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
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Hi Nghĩa
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Xin chào, Hiếu Nghĩa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Tháng 7, 2023',
                        style: TextStyle(color: Colors.blue[100]),
                      ),
                    ],
                  ),

                  //notification
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.yellow,
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 35,
              ),

              //Button tạo công ty
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 30), // Điều chỉnh kích cỡ padding của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Điều chỉnh độ cong viền của nút
                  ),
                  primary: Colors.green, // Màu sắc nút
                ),
                onPressed: () {
                  // Sự kiện khi nút được nhấn
                },
                child: Text(
                  'Tạo thông tin công ty ngay',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}

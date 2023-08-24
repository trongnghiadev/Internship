import 'package:flutter/material.dart';

class NoConnectivityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 64,
              color: Colors.red,
            ),
            SizedBox(height: 16),
            Text(
              'Không có kết nối mạng',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Vui lòng kiểm tra kết nối mạng của bạn và thử lại sau.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityChecker extends StatefulWidget {
  final Widget child;

  const ConnectivityChecker({super.key, required this.child});

  @override
  _ConnectivityCheckerState createState() => _ConnectivityCheckerState();
}

class _ConnectivityCheckerState extends State<ConnectivityChecker> {
  late Stream<ConnectivityResult> _connectivityStream;
  bool _isConnected = true;

  @override
  void initState() {
    super.initState();
    _connectivityStream = Connectivity().onConnectivityChanged;
    _connectivityStream.listen((result) {
      setState(() {
        _isConnected = result != ConnectivityResult.none;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child; // Trả về widget con mặc định
  }
}

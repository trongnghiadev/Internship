import 'package:flutter/cupertino.dart';

//Logo công ty
class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/image/logo--footer 2.png',
      width: 75,
      height: 75,
    );
  }
}

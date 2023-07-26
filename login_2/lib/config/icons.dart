import 'package:flutter/cupertino.dart';

const _path = 'assets/icons/';

const icBoxship = '$_path/box.png';
const icBook = '$_path/hand_book.png';
const icSprout = '$_path/sprout.png';
const icQRCode = '$_path/qrcode.png';

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

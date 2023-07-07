import 'package:flutter/material.dart';
// import '../config/const.dart';

// class MyButton extends StatefulWidget {
//   const MyButton({super.key});

//   @override
//   State<MyButton> createState() => _MyButtonState();
// }

// class _MyButtonState extends State<MyButton> {
//   int loginAttempts = 0;
//   bool warning = false;

//   void login() {
//     if (warning) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AnimatedContainer(
//             alignment: Alignment.bottomCenter,
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//             margin: EdgeInsets.only(bottom: warning ? 0 : -100),
//             child: AlertDialog(
//               title: const Center(
//                   child: Text(
//                 'Thông báo',
//                 style: TextStyle(color: dColorMain),
//               )),
//               content: const Text(
//                   'Email hoặc mật khẩu bị sai . Tài khoản của Quý khách sẽ bị giới hạn sau 6h nếu nhập sai 5 lần liên tiếp!'),
//               actions: <Widget>[
//                 Container(
//                   height: 30,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: dColorMain,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: TextButton(
//                     child: const Text(
//                       'Đóng',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop(); // Đóng dialog
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     } else {
//       loginAttempts++;

//       if (loginAttempts >= 3) {
//         setState(() {
//           warning = true;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         login();
//       },
//       child: Container(
//         height: 60,
//         width: double.infinity,
//         margin: const EdgeInsets.symmetric(horizontal: 30),
//         decoration: BoxDecoration(
//           color: dColorMain,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: const Center(
//           child: Text(
//             'Tiếp Tục',
//             style: TextStyle(color: Colors.white, fontSize: 15),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Button Event',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/otp': (context) => const OTPPage(),
        '/password': (context) => const PasswordPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void handleLoginButtonPressed(BuildContext context) {
    // TODO: Xử lý sự kiện khi nút bấm được nhấn trong trang Login
    // Kiểm tra nếu nhập email chưa có tài khoản, chuyển hướng đến trang OTP
    // Ngược lại, chuyển hướng đến trang mật khẩu

    final bool emailExists = true; // Giả sử email đã tồn tại

    if (emailExists) {
      Navigator.pushNamed(context, '/password');
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => handleLoginButtonPressed(context),
          child: const Text('Login'),
        ),
      ),
    );
  }
}

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OTP')),
      body: Center(child: const Text('Enter OTP')),
    );
  }
}

class PasswordPage extends StatelessWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password')),
      body: Center(child: const Text('Enter Password')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Container(
//                 width: double.infinity,
//                 color: dColorMain,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 20,
//                     bottom: 10,
//                     left: 30,
//                     right: 30,
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: const [
//                               Icon(
//                                 Icons.account_circle,
//                                 color: Colors.white,
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 'Xin chào, Khoa',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: const Color(0xffDCDCDC),
//                             ),
//                             child: const Icon(
//                               Icons.notifications,
//                               color: Colors.amber,
//                             ),
//                           )
//                         ],
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                             top: 30,
//                             bottom: 0,
//                             left: 0,
//                             right: 0,
//                           ),
//                           child: Container(
//                             height: 130,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               color: const Color(0xffFFFBE7),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text(
//                                   'Chưa có thông tin công ty',
//                                   style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 ElevatedButton(
//                                   style: ButtonStyle(
//                                     backgroundColor:
//                                         MaterialStateProperty.all<Color>(
//                                             dColorMain),
//                                   ),
//                                   onPressed: null,
//                                   child: const Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 80),
//                                     child: Text(
//                                       'Tạo ngay',
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(
//                 top: 30,
//                 bottom: 0,
//                 left: 20,
//                 right: 0,
//               ),
//               child: Row(
//                 children: [
//                   Text(
//                     'Tiện',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     'ích',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 4,
//               child: GridView.count(
//                 primary: false,
//                 padding: const EdgeInsets.all(20),
//                 crossAxisSpacing: 30,
//                 mainAxisSpacing: 50,
//                 crossAxisCount: 2,
//                 children: const <Widget>[
//                   ItemMain(
//                     icon: Icons.account_circle,
//                     textName: 'Quản lý sản phẩm',
//                     color: Colors.blue,
//                     colorIt: Colors.white,
//                     colorIc: Colors.white,
//                   ),
//                   ItemMain(
//                     icon: Icons.library_books,
//                     textName: 'Quản lý log book',
//                     color: Color(0xffEE7C35),
//                     colorIt: Colors.white,
//                     colorIc: Colors.white,
//                   ),
//                   ItemMain(
//                     icon: Icons.local_florist,
//                     textName: 'Quản lý mùa vụ',
//                     color: dColorMain,
//                     colorIt: Colors.white,
//                     colorIc: Colors.white,
//                   ),
//                   ItemMain(
//                     icon: Icons.qr_code,
//                     textName: 'Quản lý QRCode',
//                     color: Color(0xffDDDDDD),
//                     colorIt: Colors.black,
//                     colorIc: Colors.black,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

//Chưa xong 4 cục giữa màn hình, lát để vào chat GPT hỏi thêm 4 cục
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: dColorMain,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 30,
                right: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Xin chào, Khoa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // _handleItemClick(context, index);
            },
            child: Container(
              color: _getColorByIndex(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Mời tạo công ty',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // _handleItemClick(context, index);
                          },
                          child: const Text('Tạo công ty'),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _getIconByIndex(index),
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _getTextByIndex(index),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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

  Color _getColorByIndex(int index) {
    switch (index) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.orange;
      case 2:
        return Colors.green;
      case 3:
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }

  IconData _getIconByIndex(int index) {
    switch (index) {
      case 0:
        return Icons.account_circle;
      case 1:
        return Icons.library_books;
      case 2:
        return Icons.local_florist;
      case 3:
        return Icons.qr_code;
      default:
        return Icons.error;
    }
  }

  String _getTextByIndex(int index) {
    switch (index) {
      case 0:
        return 'Quản lý sản phẩm';
      case 1:
        return 'Quản lý log book';
      case 2:
        return 'Quản lý mùa vụ';
      case 3:
        return 'Quản lý QRCode';
      default:
        return '';
    }
  }

//Xét sự kiện chuyển trang
  // void _handleItemClick(BuildContext context, int index) {
  //   switch (index) {
  //     case 0:
  //       _navigateToProductManagementPage(context);
  //       break;
  //     case 1:
  //       _navigateToLogBookManagementPage(context);
  //       break;
  //     case 2:
  //       _navigateToSeasonManagementPage(context);
  //       break;
  //     case 3:
  //       _navigateToQRCodeManagementPage(context);
  //       break;
  //   }
  // }

// Xét sự kiện chuyển trang
//   void _navigateToProductManagementPage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => ProductManagementPage()),
//     );
//   }

//   void _navigateToLogBookManagementPage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => LogBookManagementPage()),
//     );
//   }

//   void _navigateToSeasonManagementPage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SeasonManagementPage()),
//     );
//   }

//   void _navigateToQRCodeManagementPage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => QRCodeManagementPage()),
//     );
//   }
// }
}

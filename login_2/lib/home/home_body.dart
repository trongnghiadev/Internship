// import 'package:flutter/material.dart';

// class HomeBody extends StatelessWidget {
//   HomeBody({super.key});

// //Tạo list data
//   List catNames = [
//     "Quản lý sản phẩm",
//     "Quản lý logBook",
//     "Quản lý mùa vụ",
//     "Quản lý QRCode",
//   ];

//   List<Color> catColors = [
//     Color(0xFF407DEE),
//     Color(0xFFEE7C35),
//     Color(0xFF2FAA40),
//     Color(0xFFDDDDDD),
//   ];

//   List<Icon> catIcons = [
//     Icon(Icons.category, color: Colors.white, size: 30),
//     Icon(Icons.health_and_safety_outlined, color: Colors.white, size: 30),
//     Icon(Icons.store, color: Colors.white, size: 30),
//     Icon(Icons.emoji_events, color: Colors.white, size: 30),
//   ];

//   List imgList = [
//     'Box'
//         'Hand_book'
//         'Sprout'
//         'QRCode'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
//             decoration: BoxDecoration(
//               color: Color(0xFF11A44B),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(
//                       Icons.dashboard,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                     Icon(
//                       Icons.notifications,
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: EdgeInsets.only(left: 3, bottom: 15),
//                   child: Text(
//                     'Xin chào, Nghĩa',
//                     style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 1,
//                         wordSpacing: 2,
//                         color: Colors.white),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 5, bottom: 20),
//                   width: MediaQuery.of(context).size.width,
//                   height: 55,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Xử lý sự kiện khi nhấn nút
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.green,
                    
//                     ),
//                     child: Text(
//                       'Tạo công ty',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 20, left: 15, right: 15),
//             child: Column(
//               children: [
//                 // GridView.builder(
//                 //   itemCount: catNames.length,
//                 //   shrinkWrap: true,
//                 //   physics: NeverScrollableScrollPhysics(),
//                 //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 //     crossAxisCount: 3,
//                 //     childAspectRatio: 1.1,
//                 //   ),
//                 //   itemBuilder: (BuildContext context, int index) {
//                 //     return Column(
//                 //       children: [
//                 //         Container(
//                 //           height: 60,
//                 //           width: 60,
//                 //           decoration: BoxDecoration(
//                 //             color: catColors[index],
//                 //             shape: BoxShape.circle,
//                 //           ),
//                 //           child: Center(
//                 //             child: catIcons[index],
//                 //           ),
//                 //         ),
//                 //         SizedBox(height: 10),
//                 //         Text(
//                 //           catNames[index],
//                 //           style: TextStyle(
//                 //               fontSize: 16,
//                 //               fontWeight: FontWeight.w500,
//                 //               color: Colors.black.withOpacity(0.7)),
//                 //         )
//                 //       ],
//                 //     );
//                 //   },
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Tiện ích",
//                       style: TextStyle(
//                         fontSize: 23,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     // Text(
//                     //   "See all",
//                     //   style: TextStyle(
//                     //       fontSize: 18,
//                     //       fontWeight: FontWeight.w500,
//                     //       color: Color(0xFF2FAA40)),
//                     // ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 GridView.builder(
//                   itemCount: imgList.length,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio:
//                         (MediaQuery.of(context).size.height - 50 - 25) /
//                             (4 * 240),
//                     mainAxisExtent: 10,
//                     crossAxisSpacing: 10,
//                   ),
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {},
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Color(0xFFF5F3FF),
//                         ),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(10),
//                               child: Image.asset(
//                                 "assets/image/box",
//                                 width: 100,
//                                 height: 100,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
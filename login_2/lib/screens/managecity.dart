// import 'dart:ffi';
// import 'package:flutter/material.dart';

// class AddCity extends StatefulWidget {
//   AddCity({Key? key, this.city}) : super(key: key);
//   final City? city;

//   @override
//   State<AddCity> createState() => _AddCityState();
// }


// class _AddCityState extends State<AddCity> {
//   final strName = TextEditingController();
//   final strNameCity = TextEditingController();
//   final strSDT = TextEditingController();
//   final strAddress = TextEditingController();
//   final strWebsite = TextEditingController();
//   final strStatus = TextEditingController();
//   final strDate = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     if (widget.city != null) {
//       strName.text = widget.city!.fullname ?? '';
//       strNameCity.text = widget.city!.cityname ?? '';
//       strSDT.text = widget.city!.sdt ?? '';
//       strAddress.text = widget.city!.address ?? '';
//       strWebsite.text = widget.city!.website ?? '';
//       strStatus.text =widget.city!.status ?? '';
//       strDate.text = widget.city!.date ?? '';
      
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Thông tin công ty"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(10),
//         child: ListView(children: <Widget>[
//           Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
//             child: Text(
//               'Thông tin công ty',
//               style: TextStyle(
//                 color: Colors.green,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 30,
//               ),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextField(
//               controller: strName,
//               decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'User quản lý'),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextField(
//               controller: strNameCity,
//               decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Tên công ty'),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextField(
//               controller: strSDT,
//               decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Số điện thoại'),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextField(
//               controller: strAddress,
//               decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Địa chỉ'),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextField(
//               controller: strWebsite,
//               decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Website'),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextField(
//               controller: strStatus,
//               decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Tình trạng'),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextField(
//               controller: strDate,
//               decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Ngày tạo'),
//             ),
//           ),
//           Container(
//             height: 50,
//             padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//             child: ElevatedButton(style: ElevatedButton.styleFrom(),
//             child: Text('Save'),
//             onPressed: () {
//               //Sự kiện
//             },
//             ),
      
//           ),
//         ]),
//       ),
//     );
//   }
// }

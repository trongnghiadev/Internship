// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../models/product_detail_model.dart';
//
//
//
// class LogbookScreen extends StatelessWidget {
//
//   final String jsonString =
//       '{"id":4,"productId":14,"content":"[{\\"number_of_day\\":0,\\"content\\":\\"Bón lót, phun cải tạo đất, diệt ốc bươu vàng\\"},{\\"number_of_day\\":2,\\"content\\":\\"Sạ lúa, diệt mầm\\"},{\\"number_of_day\\":9,\\"content\\":\\"Phun thuốc cải tạo đất, bón dinh dưỡng, kiểm tra ngừa bọ trĩ, muỗi hành và cỏ cây\\"},{\\"number_of_day\\":20,\\"content\\":\\"Bón NPK hữu cơ, cải tạo đất, phun ngừa sâu\\"},{\\"number_of_day\\":30,\\\"content\\":\\"Phun dinh dưỡng hữu cơ, phát triển rễ, nở bụi, phun thuốc cứng cây, ngừa nấm, sâu bệnh cây\\"},{\\"number_of_day\\":40,\\"content\\":\\"Phun dinh dưỡng hữu cơ, bổ sung vi lượng, cải tạo đất, ngừa sâu\\"},{\\"number_of_day\\":57,\\"content\\":\\"Phun dinh dưỡng, ngừa nấp bệnh, phân hữu cơ cứng cây, chống sâu bệnh\\"},{\\"number_of_day\\":70,\\"content\\":\\"Bón đoán đòng, ngừa bệnh lem lép hạt, bổ sung NPK, phun dinh dưỡng, ngừa rầy nâu\\"},{\\"number_of_day\\":82,\\"content\\":\\"Phun dinh dưỡng, vô gạo nhanh, ngừa rầy nâu\\"},{\\"number_of_day\\":92,\\"content\\":\\"Phun dinh dưỡng, vô gạo nhanh, ngừa rầy nâu\\"},{\\"number_of_day\\":105,\\"content\\":\\"Thu hoạch\\"}]"}';
//
//
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> jsonData = json.decode(jsonString);
//     Data data = Data.fromJson(jsonData);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Display'),
//       ),
//       body: ListView.builder(
//         itemCount: data.steps.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Step ${data.steps[index].numberOfDay}'),
//             subtitle: Text(data.steps[index].content),
//           );
//         },
//       ),
//     );
//   }
// }

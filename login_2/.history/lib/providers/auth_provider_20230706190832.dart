// import 'dart:convert';

// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;

// class AuProvider extends ChangeNotifier {
//   String _token = '';
//   int _expires = 0;

//   bool get isAuth {
//     return _token.isNotEmpty;
//   }

//   Future<void> _authentication(String email, String type) {
//     final url = 'https://stg.utrace.net/users';

//     try {
//       http.post(
//         Uri.parse(url),
//         headers: <String, String>{
//           'Content-type': 'application/json; charset=UTF-8',
//         },
//         body: jsonDecode(
//           {"email": email},
//         ),
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
// }

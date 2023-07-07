import 'package:http/http.dart' as http;

String _url = "https://stg.utrace.net/users";

// class Api {
//   Future<http.Response> getAccountAll(String token) {
//     return http.get(Uri.parse("$_url"));
//   }
// }

class Pika {
  Future<http.Response> getAccountAll(String token) {
    return http.get(Uri.parse("$_url"));
  }
}

Future<http.Response> postData(Map<String, dynamic> data) {
  return http.post(
    Uri.parse("$_url"),
    body: data,
  );
}

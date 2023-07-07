import 'package:http/http.dart' as http;

class APIHelper {
  static Future<void> sendEmailRequest(String email) async {
    final url = 'https://stg.utrace.net/users/$email';
    final response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      // Xử lý thành công
      print('Yêu cầu gửi email thành công');
    } else {
      // Xử lý lỗi
      print('Yêu cầu gửi email thất bại');
    }
  }
}

import 'package:http/http.dart' as http;

Future<void> sendEmailRequest(String email) async {
  final url = 'https://stg.utrace.net/users/$email';

  final response = await http.post(Uri.parse(url));

  if (response.statusCode == 200) {
    // Xử lý khi gửi yêu cầu thành công
    print('Yêu cầu gửi email thành công');
  } else {
    // Xử lý khi gửi yêu cầu thất bại
    print('Yêu cầu gửi email thất bại');
  }
}

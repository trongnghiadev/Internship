import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class AuthorizationData {
  Dio dio = Dio();

  Future<void> login(String email, String password) async {
    try {
      final response = await dio.post(
        Api().convertApi(Api.apiLogin),
        data: {
          email: email,
          password: password
        }, // Sử dụng Map thay vì FormData.FormData
      );
      //fix lỗi biến response chưa được sử dụng
      print(response.data);
    } catch (e) {
      return;
    }
  }
}

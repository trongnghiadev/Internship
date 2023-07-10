import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';
import 'package:dio/src/form_data.dart' as FormData;

class AuthorizationData {
  Dio dio = Dio();

  Future<void> login(String email, String password) async {
    try {
      final response = await dio.post(
        Api().convertApi(Api.apiLogin),
        data: FormData.FormData.fromMap({email: email, password: password}),
      );
    } catch (e) {
      return;
    }
  }
}

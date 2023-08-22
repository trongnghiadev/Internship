import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:login_2/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/socialLogin/login_screen.dart';

class UploadImage {
  Dio dio = Dio();

  Future<String?> upload(File imageFile) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập

    String? token = prefs.getString('token');
    if (token == null) return Get.offAll(() => const LoginScreen());

    try {
      dio.options.headers["authorization"] = token;

      FormData formData = FormData.fromMap({
        'uploaded_file': await MultipartFile.fromFile(imageFile.path),
      });

      final response = await dio.post(
        Api().convertApi(Api.apiAddImage),
        data: formData,
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.data);
        String imageUrl = jsonData['data'];
        return imageUrl;
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
    return null;
  }
}

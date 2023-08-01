import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class UploadImage {
  Dio dio = Dio();

  Future<String?> upload(File imageFile) async {
    try {
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

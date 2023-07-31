import 'dart:convert';

import 'package:dio/dio.dart';

import '../../config/api.dart';

class AddImage {
  Dio dio = Dio();

  Future<void> addImage() async {
    try {
      var image;
      FormData formData = FormData.fromMap({
        'uploaded_file': await MultipartFile.fromFile(image.path),
      });

      final imageResponse = await dio.post(
        Api().convertApi(Api.apiAddImage),
        data: formData,
      );

      if (imageResponse.statusCode == 200) {
        final data = imageResponse.data;
        final json = jsonDecode(data);

        return json[
            'uploaded_file']; // Đây là đường dẫn của hình ảnh đã được thêm vào
      }
    } catch (e) {
      print('Lỗi khi thêm hình ảnh: $e');
    }
    return null;
  }
}

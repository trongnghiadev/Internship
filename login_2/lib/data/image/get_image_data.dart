import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class GetImage {
  Dio dio = Dio();

  Future<String?> fetchData(int companyId) async {
    try {
      final getImageResponse =
          await dio.get('${Api().convertApi(Api.apiAddImage)}/$companyId');

      if (getImageResponse.statusCode == 200) {
        final data = getImageResponse.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          String imageUrl = jsonData['image_url'];
          return imageUrl;
        }
      }
    } catch (e) {
      print('Lỗi API GetImage: $e');
      return null;
    }
    return null;
  }
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class AddLogBook {
  Dio dio = Dio();

  // Các thuộc tính mới
  int? productId;
  String? content;

  Future<String?> fetchData() async {
    try {
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final createLogBookResponse = await dio.post(
        Api().convertApi(Api.apiAddLogBooks),
        data: {
          "productId": productId,
          "content": content,
        },
        options: options,
      );

      if (createLogBookResponse.statusCode == 200) {
        String addLogBookResult = '';
        final data = createLogBookResponse.data;
        final json = jsonDecode(data);

        addLogBookResult = json['status'].toString();
        return addLogBookResult;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

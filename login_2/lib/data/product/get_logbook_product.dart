import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

import '../../models/product_detail_model.dart';

class GetLogBook {
  Dio dio = Dio();

  Future<LogBooks?> fetchData(int idCompany) async {
    try {
      final getLogBookResponse =
          await dio.get('${Api().convertApi(Api.apiGetLogBook)}/$idCompany');

      if (getLogBookResponse.statusCode == 200) {
        final data = getLogBookResponse.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          dynamic logBookData = json.decode(jsonData['data']);
          LogBooks logBook = LogBooks.fromJson(logBookData);
          return logBook;
        }
      }
    } catch (e) {
      print('Lỗi API getLogBook: $e');
      return null;
    }
    return null;
  }
}

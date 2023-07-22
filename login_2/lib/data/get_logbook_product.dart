import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/models/product_model.dart';

class GetLogBook {
  Dio dio = Dio();

  Future<List<ProductModel>> fetchData(int idCompany) async {
    try {
      final getLogBookResponse = await dio
          .get('${Api().convertApi(Api.apiGetLogBook)}/$idCompany');

      if (getLogBookResponse.statusCode == 200) {
        final data = getLogBookResponse.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          List<dynamic> logBookData = json.decode(jsonData['data']);
          List<ProductModel> logBookList = [];
          for (var element in logBookData) {
            logBookList.add(ProductModel.fromJson(element));
          }
          return logBookList;
        }
      }
    } catch (e) {
      print('Lỗi API getLogBook: $e');
      return [];
    }
    return [];
  }
}

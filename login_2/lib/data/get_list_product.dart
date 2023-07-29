import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/models/product.model.dart';

class GetListProduct {
  Dio dio = Dio();

  Future<List<ProductModel>> fetchData(int idCompany) async {
    try {
      final getListProductResponse = await dio
          .get('${Api().convertApi(Api.apiGetListProduct)}/$idCompany');

      if (getListProductResponse.statusCode == 200) {
        final data = getListProductResponse.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          List<dynamic> productData = json.decode(jsonData['data']);
          List<ProductModel> productlist = [];
          for (var element in productData) {
            productlist.add(ProductModel.fromJson(element));
          }
          return productlist;
        }
      }
    } catch (e) {
      print('Lỗi API getCompanyByIdUser: $e');
      return [];
    }
    return [];
  }
}

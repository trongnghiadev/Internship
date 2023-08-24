import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/socialLogin/login_screen.dart';

class GetProductList {
  Dio dio = Dio();

  Future<List<ProductModel>> fetchData() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập

    String? token = prefs.getString('token');
    if (token == null) {
      Get.offAll(() => const LoginScreen());
      return [];
    }

    try {
      dio.options.headers["authorization"] = token;

      final getListProductResponse =
          await dio.get(Api().convertApi(Api.apiGetListProduct));

      if (getListProductResponse.statusCode == 200) {
        final data = getListProductResponse.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          List<dynamic> productData = json.decode(jsonData['data']);
          List<ProductModel> productList = [];
          for (var element in productData) {
            productList.add(ProductModel.fromJson(element));
          }
          return productList;
        }
      }
    } catch (e) {
      print('Lỗi API getCompanyByIdUser: $e');
      return [];
    }
    return [];
  }
}

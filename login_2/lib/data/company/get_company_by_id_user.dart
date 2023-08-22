import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/models/company_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/socialLogin/login_screen.dart';

class GetCompanyByUserId {
  Dio dio = Dio();

  Future<CompanyModel?> fetchData(int idUser) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập

    String? token = prefs.getString('token');
    if (token == null) return Get.offAll(() => const LoginScreen());

    try {
      dio.options.headers["authorization"] = token;

      final getCompanyByUserIdResponse =
          await dio.get('${Api().convertApi(Api.apiGetCompanyById)}/$idUser');

      if (getCompanyByUserIdResponse.statusCode == 200) {
        final data = getCompanyByUserIdResponse.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          final companyData = jsonData['data'];
          final company = CompanyModel.fromJson(companyData);
          return company;
        }
      }
    } catch (e) {
      print('Lỗi API getCompanyByIdUser: $e');
      return null;
    }
    return null;
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:login_2/config/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/member_model.dart';
import '../../screens/socialLogin/login_screen.dart';

class GetMemberListByCompanyId {
  Dio dio = Dio();

  Future<List<Member>> fetchData(int idCompany) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập

    String? token = prefs.getString('token');
    if (token == null) {
      Get.offAll(() => const LoginScreen());
      return [];
    }

    try {
      dio.options.headers["authorization"] = token;

      final getListByCompanyIdResponse = await dio
          .get('${Api().convertApi(Api.apiGetListByCompanyId)}/$idCompany');

      if (getListByCompanyIdResponse.statusCode == 200) {
        final data = getListByCompanyIdResponse.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          List<dynamic> companyData = json.decode(jsonData['data']);
          List<Member> memberList = [];
          for (var element in companyData) {
            memberList.add(Member.fromJson(element));
          }
          return memberList;
        }
      }
    } catch (e) {
      print('Lỗi API getCompanyByIdUser: $e');
      return [];
    }
    return [];
  }
}

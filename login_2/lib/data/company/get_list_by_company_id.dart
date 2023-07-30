import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

import '../../models/member_model.dart';

class GetListByCompanyId {
  Dio dio = Dio();

  Future<List<Member>> fetchData(int idCompany) async {
    try {
      final getListByCompanyIdResponse = await dio
          .get('${Api().convertApi(Api.apiGetListByCompanyId)}/$idCompany');

      if (getListByCompanyIdResponse.statusCode == 200) {
        final data = getListByCompanyIdResponse.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          List<dynamic> companyData = json.decode(jsonData['data']);
          List<Member> memberlist = [];
          for (var element in companyData) {
            memberlist.add(Member.fromJson(element));
          }
          return memberlist;
        }
      }
    } catch (e) {
      print('Lỗi API getCompanyByIdUser: $e');
      return [];
    }
    return [];
  }
}

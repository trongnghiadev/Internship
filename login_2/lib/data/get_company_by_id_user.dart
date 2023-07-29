import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/models/company.model.dart';

class GetCompanyByUserId {
  Dio dio = Dio();

  Future<CompanyModel?> fetchData(int idUser) async {
    try {
      final getCompanyByUserIdRespon =
          await dio.get('${Api().convertApi(Api.apiGetCompanyById)}/$idUser');

      if (getCompanyByUserIdRespon.statusCode == 200) {
        final data = getCompanyByUserIdRespon.data;
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

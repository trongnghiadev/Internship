import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/models/company_model.dart';

class AddCompany {
  Dio dio = Dio();

  Future<CompanyModel?> fetchData(int? userId, String? name, String? phone,
      String? address, String logo, String? website) async {
    try {
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final createCompanyResponse = await dio.post(
        Api().convertApi(Api.apiAddCompany),
        data: {
          "userId": userId,
          "name": name,
          "phone": phone,
          "address": address,
          "logo": logo,
          "website": website
        },
        options: options,
      );

      if (createCompanyResponse.statusCode == 200) {
        CompanyModel? addCompany;
        final data = createCompanyResponse.data;
        final json = jsonDecode(data);

        // addCompany = json['data'].toString();
        addCompany = CompanyModel.fromJson(json['data']);

        return addCompany;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

// ignore_for_file: file_names

import 'dart:convert' show jsonDecode;
import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class AddCompany {
  Dio dio = Dio();

  Future<String?> fetchData(int userId, String name, String phone,
      String address, String logo, String website) async {
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
        String addCompany = '';
        final data = createCompanyResponse.data;
        final json = jsonDecode(data);

        addCompany = json['status'].toString();
        return addCompany;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}

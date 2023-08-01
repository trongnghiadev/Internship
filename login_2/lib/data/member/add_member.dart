import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class AddMember {
  Dio dio = Dio();

  Future<String?> fetchData(
    int companyId, // Thêm tham số companyId
    String name,
    double acreage,
    String location,
  ) async {
    try {
      //kiểu dữ liệu tiêu chuẩn khi gửi dữ liệu dạng form-url-encoded
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final createMemberResponse = await dio.post(
        Api().convertApi(Api.apiAddMember),
        data: {
          "companyId": companyId, // Truyền companyId vào yêu cầu API
          "name": name,
          "acreage": acreage,
          "location": location,
        },
        options: options,
      );

      if (createMemberResponse.statusCode == 200) {
        String addMember = '';
        final data = createMemberResponse.data;
        final json = jsonDecode(data);

        addMember = json['status'].toString();
        return addMember;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

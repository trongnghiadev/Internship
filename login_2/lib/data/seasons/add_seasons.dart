import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class AddSeasons {
  Dio dio = Dio();

  Future<String?> fetchData({
    required String name,
    required int memberId,
    required int productId,
    required String logbook,
    required int harvest,
    required int pack,
    String? logistic,
  }) async {
    try {
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final createSeasonsResponse = await dio.post(
        Api().convertApi(Api.apiAddSeasonsList),
        // Replace Api.apiAddProduct with Api.apiAddSeasons
        data: {
          "name": name,
          "memberId": memberId,
          "productId": productId,
          "logbook": logbook,
          "harvest": harvest,
          "pack": pack,
          "logistic": logistic ?? 'null',
        },
        options: options,
      );

      if (createSeasonsResponse.statusCode == 200) {
        String addSeasons = '';
        final data = createSeasonsResponse.data;
        final json = jsonDecode(data);

        addSeasons = json['status'].toString();
        return addSeasons;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

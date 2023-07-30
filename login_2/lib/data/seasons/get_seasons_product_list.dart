import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

import '../../models/seasons_model.dart';

class GetSeasons {
  Dio dio = Dio();

  Future<List<SeasonsModel>> fetchData(int idCompany) async {
    try {
      final getSeasonsProductList = await dio.get(
          '${Api().convertApi(Api.apiGetSeasonsList)}/$idCompany'); // Replace Api.apiGetLogBook with Api.apiGetSeasonsList

      if (getSeasonsProductList.statusCode == 200) {
        final data = getSeasonsProductList.data;
        final jsonData = json.decode(data);
        final status = jsonData['status'];
        if (status == 'true') {
          List<dynamic> seasonsData = json.decode(jsonData['data']);
          List<SeasonsModel> seasonsList = [];
          for (var element in seasonsData) {
            seasonsList.add(SeasonsModel.fromJson(element));
          }
          return seasonsList;
        }
      }
    } catch (e) {
      print('Lỗi API getSeasonsProductList: $e');
      return [];
    }
    return [];
  }
}

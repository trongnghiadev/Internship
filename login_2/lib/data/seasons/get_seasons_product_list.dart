import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

import '../../models/seasons_model.dart';

class GetSeasonsList {
  Dio dio = Dio();

  Future<List<SeasonsModel>> fetchData(int idProduct) async {
    try {
      final getSeasonsProductList = await dio.get(
          '${Api().convertApi(Api.apiGetSeasonsList)}/$idProduct'); // Replace Api.apiGetLogBook with Api.apiGetSeasonsList

      if (getSeasonsProductList.statusCode == 200) {
        final data = getSeasonsProductList.data;
        final jsonData = await json.decode(data);
        final status = jsonData['status'];
        List<dynamic> seasonsData = jsonData['data'];
        if (status == 'true') {
          List<SeasonsModel> seasonsList = [];
          for (var element in seasonsData) {
            SeasonsModel newSeason = SeasonsModel.fromJson(element);
            seasonsList.add(newSeason);
          }
          return seasonsList;
        }
        return [];
      }
    } catch (e) {
      print('Lỗi API getSeasonsProductList: $e');
      return [];
    }
    return [];
  }
}

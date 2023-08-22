import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/seasons_model.dart';

class GetSeasonsList {
  Dio dio = Dio();

  Future<List<SeasonsModel>> fetchData(int idProduct) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập

    String? token = prefs.getString('token');
    if (token == null) {
      Get.offAll(() => const LoginScreen());
      return [];
    }

    try {
      dio.options.headers["authorization"] = token;

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

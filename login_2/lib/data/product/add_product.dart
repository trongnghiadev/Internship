import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:login_2/config/api.dart';

class AddProduct {
  Dio dio = Dio();

  Future<String?> fetchData(
      int companyId,
      String productKey,
      String name,
      String description,
      String content,
      String productionUnitCode,
      double acreage,
      String rawMaterialArea,
      String photos,
      String recipe,
      String recipePhotos,
      String farmingPhotos,
      String video,
      String certification) async {
    try {
      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final createProductResponse = await dio.post(
        Api().convertApi(Api.apiAddProduct),
        data: {
          "companyId": companyId,
          "productKey": productKey,
          "name": name,
          "description": description,
          "content": content,
          "productionUnitCode": productionUnitCode,
          "acreage": acreage,
          "rawMaterialArea": rawMaterialArea,
          "photos": photos,
          "recipe": recipe,
          "recipePhotos": recipePhotos,
          "farmingPhotos": farmingPhotos,
          "video": video,
          "certification": certification,
        },
        options: options,
      );

      if (createProductResponse.statusCode == 200) {
        String addCProduct = '';
        final data = createProductResponse.data;
        final json = jsonDecode(data);

        addCProduct = json['status'].toString();
        return addCProduct;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

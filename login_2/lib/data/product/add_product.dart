import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/toast_message.dart';

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
      String certification,
      {FToast? toast}) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập

    String? token = prefs.getString('token');
    if (token == null) return Get.offAll(() => const LoginScreen());

    try {
      dio.options.headers["authorization"] = token;

      final options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final createProductResponse = await dio.post(
        Api().convertApi(Api.apiAddProduct),
        data: {
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
        if (addCProduct == 'true') {
          toast?.showToast(
            child: ToastMessage(
              message: 'Tạo sản phẩm thành công',
              icon: Icons.check_circle_sharp,
              // Red X icon
              backgroundColor: Colors.lightGreen[800],
              // Light red background
              textColor: Colors.white, // Red text color
            ),
          );
        } else {
          toast?.showToast(
            child: const ToastMessage(
              message: 'Tạo sản phẩm thất bại',
              icon: Icons.close_rounded,
              // Red X icon
              backgroundColor: Colors.red,
              // Light red background
              textColor: Colors.white, // Red text color
            ),
          );
        }
        return addCProduct;
      } else {
        if (toast == null) return null;

        toast.showToast(
          child: const ToastMessage(
            message: 'Xảy ra lỗi vui lòng thử lại',
            icon: Icons.error,
            // Red X icon
            backgroundColor: Colors.red,
            // Light red background
            textColor: Colors.white, // Red text color
          ),
        );
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

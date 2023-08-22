import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/screens/socialLogin/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/toast_message.dart';

class AddMember {
  Dio dio = Dio();

  Future<String?> fetchData(
      int companyId, // Thêm tham số companyId
      String name,
      double acreage,
      String location,
      {FToast? toast}) async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); // Lưu email đã đăng nhập

    String? token = prefs.getString('token');
    if (token == null) return Get.offAll(() => const LoginScreen());

    try {
      dio.options.headers["authorization"] = token;

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
        if (addMember == 'true') {
          toast?.showToast(
            child: ToastMessage(
              message: 'Tạo thành viên thành công',
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
              message: 'Tạo thành viên thất bại',
              icon: Icons.close_rounded,
              // Red X icon
              backgroundColor: Colors.red,
              // Light red background
              textColor: Colors.white, // Red text color
            ),
          );
        }

        return addMember;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}

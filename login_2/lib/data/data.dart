import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:login_2/config/api.dart';
// import 'package:login_2/screens/otp_screen.dart';
import 'package:login_2/screens/signup_screen.dart';
import 'package:dio/src/form_data.dart' as FormData;

class OTPData {
  Dio dio = Dio();
  Future<String?> fetchData(String email) async {
    try {
      print(Api().convertApi(Api.apiCheckEmail) + email);
      final response =
          await dio.get('${Api().convertApi(Api.apiCheckEmail)}/$email');
      String status = '';

      if (response.statusCode == 200) {
        final data = response.data;
        final json = jsonDecode(data);
        status = json['data']['emailVerified'].toString();

        return status;
        // if (status == 'false') {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => OtpScreen(
        //               email: email,
        //             )),
        //   );
        // } else {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => OtpScreen(
        //               email: email,
        //             )),
        //   );
        //   print('Tài khoản đã tồn tại');
        // }
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future checkOTP(String email, String optCode) async {
    dio.options.contentType = 'application/x-www-form-urlencoded';

    final response = await dio.post(Api().convertApi(Api.apiCheckOtp),

        //coi kĩ chỗ này
        data: {"email": email, "otp": optCode},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          followRedirects: true,
        ));

    // ));
    // data:
    // convert.jsonEncode({"email": email, "otp": optCode});
    if ((jsonDecode(response.data))['status'] == true) {
      //Navigar to chỗ này chuyển trang
      Get.to(() => SignupScreen());
    } else {}
  }
}

// Future<String> AddCompany(String userid, String name, String phone,
//     String address, String logo, String website) async {
//   String url = Api().convertApi(Api.apiAddCompany);

//   Map<String, dynamic> formMap = {
//     "userid": userid,
//     "name": name,
//     "phone": phone,
//     "address": address,
//     "logo": logo,
//     "website": website,
//   };

//   final response = await dio.post(url, data: formMap);
//   return response.data;
// }

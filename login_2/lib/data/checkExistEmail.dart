import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:login_2/config/api.dart';

class checkExistEmail {
  Dio dio = Dio();

  Future<String?> fetchData(String email) async {
    try {
      print(Api().convertApi(Api.apiCheckExistEmail) + email);
      final checkExistEmailResponse =
          await dio.get('${Api().convertApi(Api.apiCheckExistEmail)}/$email');
      if (checkExistEmailResponse.statusCode == 200) {
        String existEmail = '';
        final data = checkExistEmailResponse.data;
        final json = jsonDecode(data);
        existEmail = json['status'].toString();
        return existEmail;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
//     if (existEmail == 'false') {
//       // hell code
//       print(Api().convertApi(Api.apiRegister));

//       //truyền
//       final options = Options(
//         contentType: Headers.formUrlEncodedContentType,
//       );

//       final registerResponse = await dio.post(
//         Api().convertApi(Api.apiRegister),
//         data: {"email": email},
//         options: options,
//       );
//       //Cục này hứng registerResponse
//       if (registerResponse.statusCode == 200) {
//         String registerEmail = 'false';

//         //trả về data như thế nào
//         final data = registerResponse.data;

//         //chuyển data bảo đảm data là dạng json, nên Decode
//         final json = jsonDecode(data);

//         registerEmail = json['status'].toString();
//         if (registerEmail == 'true') {
//           Navigator.push(
//             context!,
//             MaterialPageRoute(
//               builder: (context) => OtpScreen(
//                 email: email,
//               ),
//             ),
//           );
//         }
//       }
//       // Xử lý phản hồi từ việc đăng ký
//     }
//     // if (status == 'false') {
//     //   Navigator.push(
//     //     context,
//     //     MaterialPageRoute(
//     //         builder: (context) => OtpScreen(
//     //               email: email,
//     //             )),
//     //   );
//     // } else {
//     //   Navigator.push(
//     //     context,
//     //     MaterialPageRoute(
//     //         builder: (context) => OtpScreen(
//     //               email: email,
//     //             )),
//     //   );
//     //   print('Tài khoản đã tồn tại');
//     // }
//   }
//   } catch (e); {
//     print(e);
//   }
// }

// Future checkOTP(String email, String optCode) async {
//   dio.options.contentType = 'application/x-www-form-urlencoded';

//   final response = await dio.post(Api().convertApi(Api.apiCheckOtp),

//       //coi kĩ chỗ này
//       data: {"email": email, "otp": optCode},
//       options: Options(
//         contentType: Headers.formUrlEncodedContentType,
//         followRedirects: true,
//       ));

//   // ));
//   // data:
//   // convert.jsonEncode({"email": email, "otp": optCode});
//   if ((jsonDecode(response.data))['status'] == true) {
//     //Navigar to chỗ này chuyển trang
//     Get.to(() => SignupScreen());
//   } else {}
// }



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
//   }
// }
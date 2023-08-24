import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/models/company_model.dart';
import 'package:login_2/screens/account/account.management.screen.dart';
import 'package:login_2/screens/otp/qr_scanner_screen.dart';
import 'package:login_2/screens/product/products_list_screen.dart';
import 'package:login_2/utils/connectivity_mixin.dart';
import 'package:login_2/widgets/item_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/api.dart';
import '../../data/company/get_company_by_id_user.dart';
import '../../store/storecontroller.dart';
import '../../widgets/buttons/button_bottom.dart';
import '../../widgets/toast_message.dart';
import '../company/info_company_screen.dart';
import '../member/member_list_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  final storeController = Get.find<StoreController>();

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  CompanyModel company = CompanyModel();
  final GetCompanyByUserId _companyByUserId = GetCompanyByUserId();
  late String companyName = "Bạn chưa có công ty";
  late bool companyexist = false;
  late String addCompany = "Tạo công ty";
  late FToast toast;

//   static String iframeHtml = Uri.dataFromString('''
//   <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.548592550928!2d106.65568031082478!3d10.7692307592817!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752eea038d8985%3A0xaf4b41b414c7ad73!2zMjIxIEzDvSBUaMaw4budbmcgS2nhu4d0LCBQaMaw4budbmcgMTUsIFF14bqtbiAxMSwgVGjDoG5oIHBo4buRIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1689700838935!5m2!1svi!2s" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
// ''', mimeType: 'text/html').toString();

  Future<void> clearSavedState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  void initState() {
    super.initState();
    _fetchCompanyData(); // Gọi phương thức để lấy dữ liệu công ty khi MainScreen được khởi tạo
    toast = FToast(); // 2 dòng cuối khởi tạo để hiện toast
    toast.init(context);
  }

  Future<void> _fetchCompanyData() async {
    final userId = widget.storeController.storeUser.value
        .id; // Lấy ID người dùng từ storeController

    if (userId == null) return;

    final company = await _companyByUserId.fetchData(userId);

    if (company != null) {
      widget.storeController.updateCompany(company);
    }

    if (company != null) {
      setState(() {
        this.company = company;
        companyName = company.name!;
        companyexist = true;
        addCompany = "Xem Thông Tin";
        // Cập nhật thông tin công ty trong MainScreen
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityWrapper(
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.dColorMain,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Get.to(AccountManagement()),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 10),
                                Obx(() => Text(
                                      'Xin chào ${widget.storeController.storeUser.value.fullname}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const QRViewExample());
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffDCDCDC),
                                ),
                                child: const Icon(
                                  Icons.qr_code_scanner_sharp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            bottom: 0,
                            left: 0,
                            right: 0,
                          ),
                          child: Container(
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFBE7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: companyexist
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 85,
                                        height: 85,
                                        child: company.logo != ''
                                            ? ClipOval(
                                                child: Image.network(
                                                  '${Api().convertApi(Api.apiGetImage)}/${company.logo}' ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Container(
                                                width: 150.0,
                                                height: 150.0,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.dColorMain,
                                                ),
                                                child: Center(
                                                  child: ClipOval(
                                                    child: Container(
                                                      width: 110.0,
                                                      height: 110.0,
                                                      color: Colors.white,
                                                      child: Image.asset(
                                                        'assets/image/logo--footer 2.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            companyName,
                                            style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          CustomButton(
                                            onTap: () {
                                              // Get.to(InfoScreen(company: company));
                                              Get.to(() => InfoScreen(
                                                      company: company))
                                                  ?.then((value) {
                                                _fetchCompanyData();
                                              });
                                            },
                                            text: addCompany,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        companyName,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      CustomButton(
                                        onTap: () {
                                          // Get.to(InfoScreen(company: company));
                                          Get.to(() =>
                                                  InfoScreen(company: company))
                                              ?.then((value) {
                                            _fetchCompanyData();
                                          });
                                        },
                                        text: addCompany,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 0,
                  left: 20,
                  right: 0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Tiện ích',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 30,
                mainAxisSpacing: 50,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      if (companyexist) {
                        Get.to(() => ProductsListScreen());
                      } else {
                        toast.showToast(
                          child: const ToastMessage(
                              message: 'Vui lòng tạo công ty'),
                          gravity: ToastGravity.BOTTOM,
                        );
                      }
                    },
                    child: const ItemMain(
                      icon: Icons.local_florist,
                      textName: 'Quản lý sản phẩm',
                      color: Colors.blue,
                      colorIt: Colors.white,
                      colorIc: Colors.white,
                    ),
                  ),
                  // Thêm các child widget khác vào đây (nếu có)
                  // InkWell(
                  //   onTap: () {
                  //     if (companyexist) {
                  //       // Get.to(() => ProductsListScreen());
                  //     } else {
                  //       toast.showToast(
                  //         child: const ToastMessage(
                  //             message: 'Tính năng đang được phát triển'),
                  //         gravity: ToastGravity.BOTTOM,
                  //       );
                  //     }
                  //   },
                  //   child: const ItemMain(
                  //     icon: Icons.library_books,
                  //     textName: 'Quản lý canh tác',
                  //     color: Color(0xffEE7C35),
                  //     colorIt: Colors.white,
                  //     colorIc: Colors.white,
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      if (companyexist) {
                        Get.to(() => MemberListScreen());
                      } else {
                        toast.showToast(
                          child: const ToastMessage(
                              message: 'Vui lòng tạo công ty'),
                          gravity: ToastGravity.BOTTOM,
                        );
                      }
                    },
                    child: const ItemMain(
                      icon: Icons.account_circle,
                      textName: 'Quản lý thành viên',
                      color: Color(0xffDDDDDD),
                      colorIt: Colors.black,
                      colorIc: Colors.black,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: 500,
              //   height: 400,
              //   child: LazyLoadIframeHtmlWidget(iframeHtml: iframeHtml),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

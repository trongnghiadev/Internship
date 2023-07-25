import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/models/company_model.dart';
import 'package:login_2/screens/info_product_screen.dart';
import 'package:login_2/screens/member_list_screen.dart';
import 'package:login_2/screens/products_list_screen.dart';
import 'package:login_2/widgets/item_main.dart';
import 'package:get/get.dart';
import '../store/storecontroller.dart';
import '../widgets/button_bottom.dart';
import 'package:login_2/data/get_company_by_id_user.dart';
import '../widgets/toast_message.dart';
import '../widgets/widget_from_html.dart';
import 'info_company_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  final storeController = Get.find<StoreController>();
  CompanyModel company = CompanyModel();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GetCompanyByUserId _companyByUserId = GetCompanyByUserId();
  late String companyName = "Bạn chưa có công ty";
  late bool companyexist = false;
  late String addCompany = "Tạo công ty";
  late FToast toast;
  static String iframeHtml = Uri.dataFromString('''
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.548592550928!2d106.65568031082478!3d10.7692307592817!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752eea038d8985%3A0xaf4b41b414c7ad73!2zMjIxIEzDvSBUaMaw4budbmcgS2nhu4d0LCBQaMaw4budbmcgMTUsIFF14bqtbiAxMSwgVGjDoG5oIHBo4buRIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1689700838935!5m2!1svi!2s" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
''', mimeType: 'text/html').toString();

  @override
  void initState() {
    super.initState();
    _fetchCompanyData(); // Gọi phương thức để lấy dữ liệu công ty khi MainScreen được khởi tạo
  }

  Future<void> _fetchCompanyData() async {
    final userId = widget.storeController.storeUser.value.id; // Lấy ID người dùng từ storeController
    final company = await _companyByUserId.fetchData(userId!);

    if (company != null) {
      widget.storeController.updateCompany(company);
    }

    if (company != null) {
      setState(() {
        widget.company = company;
        companyName = company.name!;
        companyexist = true;
        addCompany = "Xem Thông Tin Công Ty";
        // Cập nhật thông tin công ty trong MainScreen
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Row(
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffDCDCDC),
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.amber,
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
                          child: Column(
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
                                  Get.to(InfoScreen(company: widget.company));
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
                        child: const ToastMessage(message: 'Vui lòng tạo công ty'),
                        gravity: ToastGravity.BOTTOM,
                      );
                    }
                  },
                  child: const ItemMain(
                    icon: Icons.drive_folder_upload,
                    textName: 'Quản lý sản phẩm',
                    color: Colors.blue,
                    colorIt: Colors.white,
                    colorIc: Colors.white,
                  ),
                ),
                // Thêm các child widget khác vào đây (nếu có)
                InkWell(
                  onTap: () => Get.to(() => ProductsListScreen()),
                  child: const ItemMain(
                    icon: Icons.library_books,
                    textName: 'Quản lý canh tác',
                    color: Color(0xffEE7C35),
                    colorIt: Colors.white,
                    colorIc: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(() => ProductScreen()),
                  child: const ItemMain(
                    icon: Icons.local_florist,
                    textName: 'Quản lý mùa vụ',
                    color: AppColors.dColorMain,
                    colorIt: Colors.white,
                    colorIc: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(() => MemberListScreen()),
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
            SizedBox(
              width: 500,
              height: 400,
              child: LazyLoadIframeHtmlWidget(iframeHtml: iframeHtml),
            ),
          ],
        ),
      ),
    );
  }
}

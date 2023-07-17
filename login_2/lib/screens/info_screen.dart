import 'package:flutter/material.dart';
import 'package:login_2/models/company_model.dart';
import 'package:login_2/screens/main_screen.dart';
import 'package:login_2/store/storecontroller.dart';
import 'package:login_2/utils/phonenumber_regex.dart';
import 'package:login_2/utils/website_regex.dart';
import 'package:login_2/widgets/button_bottom.dart';
import 'package:get/get.dart';
import '../data/add_company.dart';

class InfoScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();
  final CompanyModel company; // Thêm tham số company

  InfoScreen({Key? key, required this.company}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _textIsRequired = 'Thông tin này là bắt buộc';
  final _textPhoneNumberFormat = 'Số điện thoại không hợp lệ';
  final _textWebsiteFormat = 'Website không hợp lệ';

  final _formKey = GlobalKey<FormState>();
  final userManageController = TextEditingController();
  final nameCompanyController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final webController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Đặt giá trị ban đầu cho các TextFormField từ widget.company
    //Đã fix ở đây
    // ignore: unnecessary_null_comparison
    if (widget.company != null) {
      nameCompanyController.text = widget.company.name ?? '';
      phoneController.text = widget.company.phone ?? '';
      addressController.text = widget.company.address ?? '';
      webController.text = widget.company.website ?? '';
    }
  }

  void handleSubmit(BuildContext context) {
    final nameCompany = nameCompanyController.text;
    final phone = phoneController.text;
    final address = addressController.text;
    final website = webController.text;

    AddCompany()
        .fetchData(
            //Nếu đối tượng trước 2 dấu ? null, thì xài đối tượng đăng sau
            widget.storeController.storeUser.value.id ?? 0,
            nameCompany,
            phone,
            address,
            //logo
            "",
            website)
        .then((value) => Get.to(() => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Thông tin công ty',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.amber),
                  height: 110,
                  width: 110,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Nhấn để thêm logo',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Tên công ty',
                            prefixIcon: Icon(Icons.location_city),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _textIsRequired;
                            }
                            return null;
                          },
                          controller: nameCompanyController),

                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Số điện thoại',
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _textIsRequired;
                            }
                            if (!PhoneRegex.phonePattern.hasMatch(value)) {
                              return _textPhoneNumberFormat;
                            }
                            return null;
                          },
                          controller: phoneController),
                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Địa chỉ',
                          prefixIcon: Icon(Icons.map),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        controller: addressController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Website',
                          prefixIcon: Icon(Icons.web_asset),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return _textIsRequired;
                          }
                          if (!WebsiteRegex.websitePattern.hasMatch(value)) {
                            return _textWebsiteFormat;
                          }
                          return null;
                        },
                        controller: webController,
                      ),
                      const SizedBox(height: 20),
                      //Nút botton
                      CustomButton(
                          onTap: () {
                            if (_formKey.currentState?.validate() == true) {
                              handleSubmit(context);
                            }
                          },
                          text: 'Thay đổi')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

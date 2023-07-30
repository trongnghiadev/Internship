import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_2/models/company_model.dart';
import 'package:login_2/screens/main_screen.dart';
import 'package:login_2/store/storecontroller.dart';
import 'package:login_2/utils/phonenumber_regex.dart';
import 'package:login_2/utils/website_regex.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';

import '../../data/company/add_company.dart';

class InfoScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();
  final CompanyModel company; // Thêm tham số company

  InfoScreen({Key? key, required this.company}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  File? image;
  final _textIsRequired = 'Thông tin này là bắt buộc';
  final _textPhoneNumberFormat = 'Số điện thoại không hợp lệ';
  final _textWebsiteFormat = 'Website không hợp lệ';

  final _formKey = GlobalKey<FormState>();
  final userManageController = TextEditingController();
  final nameCompanyController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final webController = TextEditingController();
  final ImagePicker picker = ImagePicker();

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

//Thêm hình ảnh
  Future pickImage(ImageSource source) async {
    try {
      XFile? image = await picker.pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('that bai : $e');
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
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => pickImage(ImageSource.gallery),
                  child: Column(
                    children: [
                      image != null
                          ? Image.file(
                              image!,
                              height: 110,
                              width: 110,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 156, 155, 153)),
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
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
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Địa chỉ',
                            prefixIcon: Icon(Icons.map),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          controller: addressController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Website',
                            prefixIcon: Icon(Icons.web_asset),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                      ),
                      const SizedBox(height: 40),
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

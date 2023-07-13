import 'package:flutter/material.dart';
import 'package:login_2/config/stringtext.dart';
import 'package:login_2/utils/phonenumber_regex.dart';
import 'package:login_2/utils/website_regex.dart';
import 'package:login_2/widgets/button_bottom.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

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

  void handleSubmit(BuildContext context) {
    final userManage = userManageController.text;
    final nameCompany = nameCompanyController.text;
    final phone = phoneController.text;
    final address = addressController.text;
    final website = webController.text;

    // AddCompany().fetchData(
    //     //Nếu đối tượng trước 2 dấu ? null, thì xài đối tượng đăng sau
    //     widget.user.id ?? 0,
    //     nameCompany,
    //     phone,
    //     address,
    //     //logo
    //     "",
    //     website
    //     );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
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
                            hintText: 'Tên quản lý',
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _textIsRequired;
                            }
                            return null;
                          },
                          controller: userManageController),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Tên công ty',
                            prefixIcon: Icon(Icons.person),
                          ),
                          controller: nameCompanyController),

                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Số điện thoại',
                            prefixIcon: Icon(Icons.person),
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
                          prefixIcon: Icon(Icons.person),
                        ),
                        controller: addressController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Website',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return _textIsRequired;
                          }
                          if (!WebsiteRegex.websitePattern.hasMatch(value)) {
                            return null;
                          }
                          return null;
                        },
                        controller: webController,
                      ),

                      //Nút botton
                      CustomButton(
                          onTap: () {
                            if (_formKey.currentState?.validate() == true) {
                              handleSubmit(context);
                            }
                          },
                          text: textButton)
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

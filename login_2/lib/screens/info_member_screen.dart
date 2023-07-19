import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_2/data/add_member.dart';
import 'package:login_2/models/member_model.dart';
import 'package:login_2/screens/main_screen.dart';
import 'package:login_2/screens/member_list_screen.dart';
import 'package:login_2/store/storecontroller.dart';
import 'package:login_2/widgets/button_bottom.dart';

import '../store/storecontroller.dart';

class InfoMemberScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  InfoMemberScreen({super.key, this.member});
  final Member? member;

  @override
  State<InfoMemberScreen> createState() => _InfoMemberScreenState();
}

class _InfoMemberScreenState extends State<InfoMemberScreen> {
  File? image;
  final _textIsRequired = 'Thông tin này là bắt buộc';
  final _textAcreage = 'dịch tích này không hợp lệ';
  final _textLocation = 'Địa chỉ này không hợp lệ';

  final _formKey = GlobalKey<FormState>();
  final nameMemberController = TextEditingController();
  final acreageController = TextEditingController();
  final locationController = TextEditingController();

  final storeController = Get.find<StoreController>();

  @override
  void initState() {
    super.initState();
    // Đặt giá trị ban đầu cho các TextFormField từ widget.company
    //Đã fix ở đây
    // ignore: unnecessary_null_comparison
    if (widget.member != null) {
      nameMemberController.text = widget.member?.name ?? '';
      acreageController.text = widget.member?.acreage.toString() ?? '';
      locationController.text = widget.member?.location ?? '';
    }
  }

  void handleSubmit(BuildContext context) {
    final name = nameMemberController.text;
    final acreage = acreageController.text;
    final location = locationController.text;

    // Thực hiện các xử lý hoặc gọi API tương ứng ở đây
    AddMember()
        .fetchData(widget.storeController.storeCompany.value.id ?? 0, name,
            double.parse(acreage), location)
        .then((value) => Get.offAll(() => MemberListScreen()));
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
                  'Thêm hợp tác xã',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                              hintText: 'Tên hợp tác xã',
                              prefixIcon: Icon(Icons.person_2),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            controller: nameMemberController),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Diện tích',
                            prefixIcon: Icon(Icons.map),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _textIsRequired;
                            }
                            // Thêm validate cho acreage ở đây (nếu cần)
                            return null;
                          },
                          controller: acreageController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Địa điểm',
                            prefixIcon: Icon(Icons.location_on),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return _textIsRequired;
                            }
                            // Thêm validate cho location ở đây (nếu cần)
                            return null;
                          },
                          controller: locationController,
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_2/data/member/add_member.dart';
import 'package:login_2/models/member_model.dart';
import 'package:login_2/store/storecontroller.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';
import 'package:login_2/widgets/loading_placeholder.dart';

import '../../widgets/toast_message.dart';

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
  final _doubleValid = 'Không hợp lệ, kiểm tra lại (Dấu thập phân là dấu chấm)';

  // final _textAcreage = 'dịch tích này không hợp lệ';
  // final _textLocation = 'Địa chỉ này không hợp lệ';

  final _formKey = GlobalKey<FormState>();
  final nameMemberController = TextEditingController();
  final acreageController = TextEditingController();
  final locationController = TextEditingController();

  final storeController = Get.find<StoreController>();
  late FToast toast;

  bool isLoading = false;

  @override
  void initState() {
    toast = FToast();
    toast.init(context);
    super.initState();

    setState(() {
      isLoading = false;
    });
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

    setState(() {
      isLoading = true;
    });

    // Thực hiện các xử lý hoặc gọi API tương ứng ở đây
    AddMember()
        .fetchData(widget.storeController.storeCompany.value.id ?? 0, name,
            double.parse(acreage ?? '0'), location,
            toast: toast)
        .then((value) {
      setState(() {
        isLoading = false;
      });
      if (value == 'true') {
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.member != null
                          ? 'Cập nhật xã viên'
                          : 'Thêm xã viên',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
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
                                  hintText: 'Tên xã viên',
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
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: false),
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

                                if (double.tryParse(value) == null) {
                                  return _doubleValid;
                                }
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
                                if (_formKey.currentState?.validate() == true &&
                                    widget.member == null) {
                                  handleSubmit(context);
                                }
                                if (_formKey.currentState?.validate() == true &&
                                    widget.member != null) {
                                  toast.showToast(
                                    child: const ToastMessage(
                                        message:
                                            'Tính năng đang được phát triển'),
                                    gravity: ToastGravity.BOTTOM,
                                  );
                                }
                              },
                              text:
                                  widget.member != null ? 'Thay đổi' : 'Thêm'),
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
          LoadingPlaceHolder(isLoading)
        ],
      ),
    );
  }
}

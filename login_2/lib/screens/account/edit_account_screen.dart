import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/screens/account/account.management.screen.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';

import '../../store/storecontroller.dart';

class EditAccount extends StatefulWidget {
  EditAccount({super.key});

  final storeController = Get.find<StoreController>();

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final fullnamecontroller = TextEditingController();
  final contactcontroller = TextEditingController();
  final emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.dColorMain,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: const Text(
            'Chỉnh Sửa Tài Khoản',
            selectionColor: AppColors.dColorTF,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Họ tên ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: fullnamecontroller,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Số điện thoại ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: contactcontroller,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: '${widget.storeController.storeUser.value.email}',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: emailcontroller,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                onTap: () {
                  Get.to(() => AccountManagement());
                },
                text: 'Cập nhật')
          ],
        ),
      ),
    );
  }
}

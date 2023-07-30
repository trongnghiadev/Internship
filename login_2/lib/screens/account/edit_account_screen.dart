import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

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
              Navigator.pop(context);
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
                decoration: const InputDecoration(
                  hintText: 'Email ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: emailcontroller,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(onTap: () {}, text: 'Cập nhật')
          ],
        ),
      ),
    );
  }
}

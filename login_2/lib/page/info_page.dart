import 'package:flutter/material.dart';
import 'package:login_2/components/buton_save.dart';
// import 'package:login_2/components/button_save.dart';
import 'package:login_2/components/textfield_user.dart';
// import 'package:login_2/components/textfiled_user.dart';

class InfoPage extends StatelessWidget {
  InfoPage({super.key});

  final userManageController = TextEditingController();
  final nameCompanyController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final webController = TextEditingController();
  final statusController = TextEditingController();
  final dateCreateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Thông tin công ty',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.amber),
                  height: 110,
                  width: 110,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Nhấn để thêm logo',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldUser(
                    hintText: 'User quản lý', controller: userManageController),
                SizedBox(
                  height: 20,
                ),
                TextFieldUser(
                    hintText: 'Tên công ty', controller: nameCompanyController),
                SizedBox(
                  height: 20,
                ),
                TextFieldUser(
                    hintText: 'Số điện thoại', controller: phoneController),
                SizedBox(
                  height: 20,
                ),
                TextFieldUser(
                    hintText: 'Địa chỉ', controller: addressController),
                SizedBox(
                  height: 20,
                ),
                TextFieldUser(hintText: 'Website', controller: webController),
                SizedBox(
                  height: 20,
                ),
                TextFieldUser(
                    hintText: 'Tình trạng', controller: statusController),
                SizedBox(
                  height: 20,
                ),
                TextFieldUser(
                    hintText: 'Ngày tạo', controller: dateCreateController),
                SizedBox(
                  height: 20,
                ),
                ButtonSave(),
                SizedBox(
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

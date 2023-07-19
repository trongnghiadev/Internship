import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/get_company_by_id_user.dart';
import 'package:login_2/data/get_list_by_company_id.dart';
import 'package:login_2/models/member_model.dart';
import 'package:login_2/screens/info_member_screen.dart';

import '../store/storecontroller.dart';

class MemberListScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  MemberListScreen({super.key});

  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Member> memberList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> loadContacts() async {
    setState(() {
      isLoading = true;
    });
    //thêm link ở đây((
    GetCompanyByUserId()
        .fetchData(widget.storeController.storeUser.value.id ?? 0)
        .then((value) {
      if (value != null) {
        GetListByCompanyId().fetchData(value.id ?? 0).then(
          (value) {
            setState(() {
              memberList = value;
              isLoading = false;
            });
          },
        );
      }
    });

    // setState(() {
    //   contacts = jsonList.cast<Map<String, dynamic>>();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.dColorBG2,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.dColorTF,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: 'Tìm Kiếm',
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Danh sách xã viên',
                style: TextStyle(
                    color: AppColors.dColorMain,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              if (isLoading == true)
                SizedBox(
                  height: 50,
                  width: 50,
                  child: const LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    strokeWidth: 2,
                  ),
                ),
              Expanded(
                child: ListView.separated(
                  itemCount: memberList.length,
                  separatorBuilder: (context, index) => SizedBox(height: 20.0),
                  itemBuilder: (context, index) {
                    final member = memberList[index];
                    return ListTileTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: AppColors.dColorTF, // Màu nền của ListTile

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ListTile(
                          title: Text(
                            member.name ?? '',
                            style: TextStyle(fontWeight: FontWeight.bold), //
                          ),
                          subtitle: Text(
                            member.acreage.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: AppColors.dColorMain,
                          ),
                          onTap: () {},
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: buildAddContactFAB(),
      ),
    );
  }
}

Widget buildAddContactFAB() {
  return FloatingActionButton(
    onPressed: () {
      Get.to(() => InfoMemberScreen());
    },
    child: Icon(Icons.add),
    backgroundColor: AppColors.dColorMain,
  );
}

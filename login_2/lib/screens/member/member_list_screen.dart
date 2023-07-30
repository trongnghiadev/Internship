import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/company/get_list_by_company_id.dart';
import 'package:login_2/models/member_model.dart';

import '../../data/company/get_company_by_id_user.dart';
import '../../store/storecontroller.dart';
import 'info_member_screen.dart';

class MemberListScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  MemberListScreen({super.key});

  @override
  _MemberListScreenState createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  final TextEditingController _searchController = TextEditingController();
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
        appBar: AppBar(
          backgroundColor: AppColors.dColorMain,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text('Danh sách xã viên'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
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
                          hintText: 'Nhập tên xã viên',
                          suffixIcon: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading == true)
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                    strokeWidth: 2,
                  ),
                ),
              Expanded(
                child: ListView.separated(
                  itemCount: memberList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20.0),
                  itemBuilder: (context, index) {
                    final member = memberList[index];
                    return Column(
                      children: [
                        Text('${member.id}'),
                        ListTileTheme(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          tileColor: AppColors.dColorTF, // Màu nền của ListTile

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: ListTile(
                              title: Text(
                                member.name ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold), //
                              ),
                              subtitle: Text(
                                member.acreage.toString(),
                                style: const TextStyle(color: Colors.red),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right,
                                color: AppColors.dColorMain,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
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
    backgroundColor: AppColors.dColorMain,
    child: const Icon(Icons.add),
  );
}

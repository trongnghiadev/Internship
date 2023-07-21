import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/get_company_by_id_user.dart';
import 'package:login_2/data/get_list_by_company_id.dart';
import 'package:login_2/data/get_list_product.dart';
import 'package:login_2/models/member_model.dart';
import 'package:login_2/models/product.dart';
import 'package:login_2/screens/info_member_screen.dart';
import 'package:login_2/screens/info_product_screen.dart';

import '../store/storecontroller.dart';

class ProductsListScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  ProductsListScreen({super.key});

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  TextEditingController _searchController = TextEditingController();
  List<ProductModel> productlist = [];
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
    GetListProduct()
        .fetchData(widget.storeController.storeCompany.value.id ?? 0)
        .then((value) {
      setState(() {
        productlist = value;
        isLoading = false;
      });
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
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text('Danh sách sản phẩm'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 5),
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
                  itemCount: productlist.length,
                  separatorBuilder: (context, index) => SizedBox(height: 20.0),
                  itemBuilder: (context, index) {
                    final product = productlist[index];
                    return ListTileTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: AppColors.dColorTF, // Màu nền của ListTile

                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            child: Row(children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.amber,
                              ),
                              Column(
                                children: [
                                  Text(
                                    product.name ?? '',
                                  ),
                                  Text(
                                    product.recipe ?? '',
                                  ),
                                  Text(
                                    product.description ?? '',
                                  ),
                                ],
                              )
                            ]),
                          )),
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
      Get.to(() => ProductScreen());
    },
    child: Icon(Icons.add),
    backgroundColor: AppColors.dColorMain,
  );
}

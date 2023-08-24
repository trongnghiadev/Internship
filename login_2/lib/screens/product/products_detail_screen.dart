import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/models/product_model.dart';
import 'package:login_2/utils/connectivity_mixin.dart';

import '../../data/product/get_logbook_product.dart';
import '../../models/product_detail_model.dart';
import '../../store/storecontroller.dart';
import '../../widgets/toast_message.dart';
import 'info_product_screen.dart';

enum _MenuValues {
  productDetail,
  logbookDetail,
}

class ProductsDetailScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  //Khi nhấn sản phẩm nào thì nó sẽ vào đây
  final ProductModel product;

  ProductsDetailScreen({super.key, required this.product});

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  LogBooks? data;
  String imageUrl =
      'https://images.unsplash.com/photo-1634467524884-897d0af5e104?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80';

  late FToast toast;

  @override
  void initState() {
    toast = FToast();
    toast.init(context);
    super.initState();

    if (widget.product.photos != null && widget.product.photos!.isNotEmpty) {
      imageUrl =
          '${Api().convertApi(Api.apiGetImage)}/${widget.product.photos}';
    }

    GetLogBook().fetchData(widget.product.id ?? 0).then((value) {
      setState(() {
        if (value != null) {
          data = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityWrapper(
      child: Scaffold(
        backgroundColor: AppColors.dColorBG2,
        appBar: AppBar(
          actions: [
            PopupMenuButton<_MenuValues>(
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  //ontap chỉ nhận void
                  //Get to la future. Nên là sử dụng arrow funtion để => future

                  value: _MenuValues.productDetail,
                  child: Text('Cập nhật sản phẩm'),
                ),
                const PopupMenuItem(
                  value: _MenuValues.logbookDetail,
                  child: Text('Cập nhật nhật ký'),
                ),
              ],
              onSelected: (value) {
                switch (value) {
                  case _MenuValues.productDetail:
                    {
                      Get.to(() => InfoProductScreen(product: widget.product));
                      break;
                    }
                  case _MenuValues.logbookDetail:
                    // TODO: Handle this case.
                    toast.showToast(
                      child: const ToastMessage(
                          message: 'Tính năng đang được phát triển'),
                      gravity: ToastGravity.BOTTOM,
                    );
                    break;
                }
              },
            ),
          ],
          backgroundColor: AppColors.dColorMain,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: Text(widget.product.name ?? ''),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Text(
                        'Diện tích canh tác',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(9.0),
                        decoration: BoxDecoration(
                          color: AppColors.dColorMain,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        //
                        child: Text(
                          widget.product.acreage.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.dColorTF,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Color(0xffBFBFBF),
                  thickness: 2,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nhật ký canh tác',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Hiển thị danh sách nhật ký canh tác dưới dạng ListView.builder
                const SizedBox(height: 10),
                Expanded(
                  child: data != null
                      ? ListView.builder(
                          itemCount: data?.steps.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                  'Ngày ${data?.steps[index].numberOfDay}'),
                              subtitle: Text(data!.steps[index].content),
                            );
                          },
                        )
                      : const Text('Nhật ký canh tác rỗng'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*  Widget buildAddContactFAB() {
    return FloatingActionButton(
      onPressed: () {
        Get.to(() => InfoProductScreen());
      },
      backgroundColor: AppColors.dColorMain,
      child: const Icon(Icons.add),
    );
  }
}*/

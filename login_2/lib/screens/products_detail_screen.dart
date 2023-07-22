import 'package:timelines/timelines.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:login_2/config/const.dart';

import 'package:login_2/models/product_model.dart';
import 'package:login_2/screens/info_product_screen.dart';

import '../data/get_logbook_product.dart';
import '../store/storecontroller.dart';

class ProductsDetailScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  ProductsDetailScreen({super.key, required this.product});

  //Khi nhấn sản phẩm nào thì nó sẽ vào đây
  final ProductModel product;

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  final TextEditingController _searchController = TextEditingController();

  // final logbook
  // bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // loadDetailProduct();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Future<void> loadDetailProduct() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //thêm link ở đây((

  // GetLogBook()
  //     .fetchData(widget.product.id ?? 0)
  //     .then((value) {
  //   setState(() {
  //     productdetail = value;
  //     isLoading = false;
  //   });
  // });

  // setState(() {
  //   contacts = jsonList.cast<Map<String, dynamic>>();
  // });
  // }

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
          title: Text(widget.product.name ?? ''),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Container(
                  height: 200, // Điều chỉnh kích thước hình ảnh theo ý muốn
                  width: double.infinity,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1634467524884-897d0af5e104?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Hoạt động',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(9.0),
                            decoration: BoxDecoration(
                              color: AppColors.dColorMain,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Text(
                              'Hoạt động',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.dColorTF,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        height: 2,
                        width: double.infinity,
                        color: const Color(0xffBFBFBF),
                      ),
                      const Text(
                        'Nhật ký canh tác',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //coi lại đoạn code này tối ưu hơn
                      Flexible(
                        child: Timeline.tileBuilder(
                          theme: TimelineThemeData(
                            nodePosition: 0,
                            connectorTheme: const ConnectorThemeData(
                              thickness: 3.0,
                              color: Color(0xffd3d3d3),
                            ),
                            indicatorTheme: const IndicatorThemeData(
                              size: 15.0,
                            ),
                          ),
                          builder: TimelineTileBuilder.connected(
                            contentsAlign: ContentsAlign.alternating,
                            contentsBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Text('Timeline Event $index'),
                            ),
                            itemCount: 10,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
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
    backgroundColor: AppColors.dColorMain,
    child: const Icon(Icons.add),
  );
}

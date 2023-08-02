import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/product/get_list_product.dart';
import 'package:login_2/models/product_model.dart';
import 'package:login_2/screens/seasons/seasons_list_screen.dart';

import '../../store/storecontroller.dart';

class SeasonProductsListScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  SeasonProductsListScreen({super.key});

  @override
  _SeasonProductsListScreenState createState() =>
      _SeasonProductsListScreenState();
}

class _SeasonProductsListScreenState extends State<SeasonProductsListScreen> {
  final TextEditingController _searchController = TextEditingController();
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
    // Thêm link ở đây (chưa có thông tin về GetListProduct)
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
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text('Danh sách sản phẩm'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Column(
            children: [
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
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: ListView.builder(
                    itemCount: productlist.length,
                    itemBuilder: (context, index) {
                      final ProductModel product = productlist[index];
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.dColorTF, // Màu nền của ô
                              borderRadius:
                                  BorderRadius.circular(10.0), // Bo góc của ô
                            ),
                            // Màu nền của ListTile
                            child: InkWell(
                              onTap: () =>
                                  Get.to(SeasonsListScreen(product: product)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: AppColors
                                              .dColorIG, // Màu nền của ô
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Bo góc của ô
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3),
                                            child: Text(
                                              product.name ?? '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3),
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  'Diện tích: ${product.recipe}',
                                                  // product.recipe ?? '',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3),
                                            child: Text(
                                              'Mô tả: ${product.description}',
                                              // product.description ?? '',
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                              height: 20), // Khoảng cách giữa các phần tử
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
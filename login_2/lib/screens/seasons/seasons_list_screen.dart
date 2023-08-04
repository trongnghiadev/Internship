import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/models/product_model.dart';
import 'package:login_2/models/seasons_model.dart';
import 'package:login_2/screens/seasons/info_season_product_screen.dart';

import '../../data/seasons/get_seasons_product_list.dart';
import '../../store/storecontroller.dart';

class SeasonsListScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  SeasonsListScreen({super.key, this.product});

  final ProductModel? product;

  @override
  _SeasonsListScreenState createState() => _SeasonsListScreenState();
}

class _SeasonsListScreenState extends State<SeasonsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<SeasonsModel> seasonsList = [];
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

    if (widget.product == null || widget.product?.id == null) return;

    //can xem lai
    GetSeasonsList().fetchData(widget.product?.id ?? -1).then((value) {
      setState(() {
        seasonsList = value;
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
          title: const Text('Danh sách mùa vụ'),
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
                    itemCount: seasonsList.length,
                    itemBuilder: (context, index) {
                      final SeasonsModel seasons = seasonsList[index];
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
                              // onTap: () => Get.to(
                              //     ProductsDetailScreen(seasons: seasons)),
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
                                              seasons.name ?? '',
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
                                                  'Nhật ký: ${seasons.logBook}',
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
                                          // Padding(
                                          //   padding: const EdgeInsets.symmetric(
                                          //       vertical: 3),
                                          //   child: Text(
                                          //     'Mô tả: ${seasons.description}',
                                          //     // product.description ?? '',
                                          //     style: const TextStyle(
                                          //       fontSize: 16,
                                          //     ),
                                          //     maxLines: 2,
                                          //     overflow: TextOverflow.ellipsis,
                                          //   ),
                                          // ),
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
        floatingActionButton: buildAddContactFAB(),
      ),
    );
  }

  Widget buildAddContactFAB() {
    return FloatingActionButton(
      onPressed: () {
        Get.to(
            () => InfoSeasonProductScreen(productId: widget.product?.id ?? -1));
      },
      backgroundColor: AppColors.dColorMain,
      child: const Icon(Icons.add),
    );
  }
}

import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/data/product/get_list_product.dart';
import 'package:login_2/models/product_model.dart';
import 'package:login_2/screens/product/info_product_screen.dart';
import 'package:login_2/screens/product/products_detail_screen.dart';

import '../../config/api.dart';
import '../../store/storecontroller.dart';
import '../seasons/seasons_list_screen.dart';

class ProductsListScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  ProductsListScreen({super.key});

  @override
  _ProductsListScreenState createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductModel> productList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadProduct();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> loadProduct() async {
    setState(() {
      isLoading = true;
    });
    // Thêm link ở đây (chưa có thông tin về GetListProduct)
    GetProductList()
        .fetchData(widget.storeController.storeCompany.value.id ?? 0)
        .then((value) {
      setState(() {
        productList = value;
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
              Get.back();
            },
          ),
          centerTitle: true,
          title: const Text('Danh sách sản phẩm'),
        ),
        body: SingleChildScrollView(
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
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.all(30),
              //     child: ListView.builder(
              //       itemCount: productList.length,
              //       itemBuilder: (context, index) {
              //         final ProductModel product = productList[index];
              //         String imageUrl =
              //             '${Api().convertApi(Api.apiGetImage)}/${product.photos}';
              //         return Column(
              //           children: [
              //             Container(
              //               decoration: BoxDecoration(
              //                 color: AppColors.dColorTF, // Màu nền của ô
              //                 borderRadius:
              //                     BorderRadius.circular(10.0), // Bo góc của ô
              //               ),
              //               // Màu nền của ListTile
              //               child: InkWell(
              //                 onTap: () => Get.to(
              //                     ProductsDetailScreen(product: product)),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(10.0),
              //                   child: Row(
              //                     children: [
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                             horizontal: 10),
              //                         child: (product.photos) != null
              //                             ? Container(
              //                                 decoration: BoxDecoration(
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           10.0), // Bo góc của ô
              //                                 ),
              //                                 width: 80,
              //                                 height: 80,
              //                                 child: Image.network(
              //                                   imageUrl,
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               )
              //                             : Container(
              //                                 height: 80,
              //                                 width: 80,
              //                                 decoration: BoxDecoration(
              //                                   color: AppColors
              //                                       .dColorIG, // Màu nền của ô
              //                                   borderRadius:
              //                                       BorderRadius.circular(
              //                                           10.0), // Bo góc của ô
              //                                 ),
              //                               ),
              //                       ),
              //                       const SizedBox(width: 10),
              //                       Expanded(
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Padding(
              //                               padding: const EdgeInsets.symmetric(
              //                                   vertical: 3),
              //                               child: Text(
              //                                 product.name ?? '',
              //                                 style: const TextStyle(
              //                                   fontSize: 16,
              //                                   fontWeight: FontWeight.w600,
              //                                 ),
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding: const EdgeInsets.symmetric(
              //                                   vertical: 3),
              //                               child: Wrap(
              //                                 children: [
              //                                   Text(
              //                                     'Diện tích: ${product.recipe}',
              //                                     // product.recipe ?? '',
              //                                     style: const TextStyle(
              //                                       fontSize: 16,
              //                                     ),
              //                                     maxLines: 2,
              //                                     overflow:
              //                                         TextOverflow.ellipsis,
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                             Padding(
              //                               padding: const EdgeInsets.symmetric(
              //                                   vertical: 3),
              //                               child: Text(
              //                                 'Mô tả: ${product.description}',
              //                                 // product.description ?? '',
              //                                 style: const TextStyle(
              //                                   fontSize: 16,
              //                                 ),
              //                                 maxLines: 2,
              //                                 overflow: TextOverflow.ellipsis,
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(
              //                 height: 20), // Khoảng cách giữa các phần tử
              //           ],
              //         );
              //       },
              //     ),
              //   ),
              // ),
              Accordion(
                  maxOpenSections: 1,
                  contentBorderColor: Colors.white,
                  flipRightIconIfOpen: true,
                  disableScrolling: true,
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  children: productList.map((e) {
                    String imageUrl =
                        '${Api().convertApi(Api.apiGetImage)}/${e.photos}';

                    return AccordionSection(
                        rightIcon: const Icon(Icons.keyboard_arrow_down),
                        headerBackgroundColor: Colors.white,
                        header: Row(
                          children: [
                            (e.photos) != null && (e.photos) != ''
                                ? Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Bo góc của ô
                                    ),
                                    width: 70,
                                    height: 70,
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.dColorIG, // Màu nền của ô
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Bo góc của ô
                                    ),
                                  ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              e.name ?? '',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () =>
                                      Get.to(ProductsDetailScreen(product: e)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.dColorMain,
                                    // #11a44a in RGB
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text('QL. Sản phẩm'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () =>
                                      Get.to(SeasonsListScreen(product: e)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.dColorMain,
                                    // #11a44a in RGB
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Text('QL. Mùa vụ'),
                                ),
                              ],
                            ),
                            const Text(
                              'Mô tả: ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(e.description ?? ''),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ));
                  }).toList())
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
        //Khi mà get.to bất cứ màng hình nào có khả naneg Thêm xoá sửa thì thêm câu ?.then
        Get.to(() => InfoProductScreen())?.then((value) => loadProduct());
      },
      backgroundColor: AppColors.dColorMain,
      child: const Icon(Icons.add),
    );
  }
}

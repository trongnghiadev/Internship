import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/models/product_model.dart';
import '../models/product_detail_model.dart';
import '../store/storecontroller.dart';
import 'info_product_screen.dart';

class ProductsDetailScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  //Khi nhấn sản phẩm nào thì nó sẽ vào đây
  final ProductModel product;

  ProductsDetailScreen({super.key, required this.product});

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  final String jsonString =
      '{"id":4,"productId":14,"content":"[{\\"number_of_day\\":0,\\"content\\":\\"Bón lót, phun cải tạo đất, diệt ốc bươu vàng\\"},{\\"number_of_day\\":2,\\"content\\":\\"Sạ lúa, diệt mầm\\"},{\\"number_of_day\\":9,\\"content\\":\\"Phun thuốc cải tạo đất, bón dinh dưỡng, kiểm tra ngừa bọ trĩ, muỗi hành và cỏ cây\\"},{\\"number_of_day\\":20,\\"content\\":\\"Bón NPK hữu cơ, cải tạo đất, phun ngừa sâu\\"},{\\"number_of_day\\":30,\\\"content\\":\\"Phun dinh dưỡng hữu cơ, phát triển rễ, nở bụi, phun thuốc cứng cây, ngừa nấm, sâu bệnh cây\\"},{\\"number_of_day\\":40,\\"content\\":\\"Phun dinh dưỡng hữu cơ, bổ sung vi lượng, cải tạo đất, ngừa sâu\\"},{\\"number_of_day\\":57,\\"content\\":\\"Phun dinh dưỡng, ngừa nấp bệnh, phân hữu cơ cứng cây, chống sâu bệnh\\"},{\\"number_of_day\\":70,\\\"content\\":\\"Bón đoán đòng, ngừa bệnh lem lép hạt, bổ sung NPK, phun dinh dưỡng, ngừa rầy nâu\\"},{\\"number_of_day\\":82,\\"content\\":\\"Phun dinh dưỡng, vô gạo nhanh, ngừa rầy nâu\\"},{\\"number_of_day\\":92,\\"content\\":\\"Phun dinh dưỡng, vô gạo nhanh, ngừa rầy nâu\\"},{\\"number_of_day\\":105,\\"content\\":\\"Thu hoạch\\"}]"}';

  @override
  Widget build(BuildContext context) {
    Data data = Data.fromJson(json.decode(jsonString));
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
          child: Column(
            children: [
              SizedBox(
                height: 200,
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
                child: Row(
                  children: [
                    const Text(
                      'Trạng Thái:',
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
              Expanded(
                child: ListView.builder(
                  itemCount: data.steps.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Ngày ${data.steps[index].numberOfDay}'),
                      subtitle: Text(data.steps[index].content),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //coi lại đoạn code này tối ưu h

  Widget buildAddContactFAB() {
    return FloatingActionButton(
      onPressed: () {
        Get.to(() => ProductScreen());
      },
      backgroundColor: AppColors.dColorMain,
      child: const Icon(Icons.add),
    );
  }
}

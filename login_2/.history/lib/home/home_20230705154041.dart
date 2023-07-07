import 'package:flutter/material.dart';
import 'package:login_2/models/category.dart';
import 'package:login_2/widgets/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF11A44B),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Hi Nghĩa
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Xin chào, Hiếu Nghĩa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Tháng 7, 2023',
                        style: TextStyle(color: Colors.blue[100]),
                      ),
                    ],
                  ),

                  //notification
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 240, 221, 46),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 35,
            ),

            //Nút tạo công ty
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 30), // Điều chỉnh kích cỡ padding của nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Điều chỉnh độ cong viền của nút
                ),
                primary: Colors.green, // Màu sắc nút
              ),
              onPressed: () {
                // Sự kiện khi nút được nhấn
              },
              child: Text(
                'Tạo thông tin công ty ngay',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(
              height: 35,
            ),

            //Backroud tiện ích
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10), // Bo tròn đầu trên bên trái
                    topRight: Radius.circular(10), // Bo tròn đầu trên bên phải
                    bottomLeft: Radius.zero, // Không bo tròn đầu dưới bên trái
                    bottomRight: Radius.zero, // Không bo tròn đầu dưới bên phải
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      //Tiện ích
                      Row(
                        children: [
                          Text(
                            'Tiện ích',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: categoryList
                            .length, // Chỉnh sửa từ "lenth" thành "length"
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 24,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            category: categoryList[
                                index], // Truyền thông tin về category từ danh sách categoryList[index] vào CategoryCard
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_2/components/item_main.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/screens/InfoScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: dColorMain,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Xin chào, Hiếu Nghĩa',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffDCDCDC),
                            ),
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.amber,
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            bottom: 0,
                            left: 0,
                            right: 0,
                          ),
                          child: Container(
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFBE7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Chưa có thông tin công ty',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 15),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            dColorMain),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InfoScreen(), // Thay NewPage() bằng màn hình muốn chuyển đến
                                      ),
                                    );
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 80),
                                    child: Text(
                                      'Tạo ngay',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 0,
                left: 20,
                right: 0,
              ),
              child: Row(
                children: const [
                  Text(
                    'Tiện ích',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  // Text(
                  //   'ích',
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 25,
                  //       fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 30,
                mainAxisSpacing: 50,
                crossAxisCount: 2,
                children: const <Widget>[
                  ItemMain(
                    icon: Icons.account_circle,
                    textName: 'Quản lý sản phẩm',
                    color: Colors.blue,
                    colorIt: Colors.white,
                    colorIc: Colors.white,
                  ),
                  ItemMain(
                    icon: Icons.library_books,
                    textName: 'Quản lý log book',
                    color: Color(0xffEE7C35),
                    colorIt: Colors.white,
                    colorIc: Colors.white,
                  ),
                  ItemMain(
                    icon: Icons.local_florist,
                    textName: 'Quản lý mùa vụ',
                    color: dColorMain,
                    colorIt: Colors.white,
                    colorIc: Colors.white,
                  ),
                  ItemMain(
                    icon: Icons.qr_code,
                    textName: 'Quản lý QRCode',
                    color: Color(0xffDDDDDD),
                    colorIt: Colors.black,
                    colorIc: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

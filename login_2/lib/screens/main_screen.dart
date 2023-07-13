import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/widgets/item_main.dart';
import 'package:login_2/models/userModel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final String fullname = widget.user.fullname ?? "Quan Tri Vien";
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: AppColors.dColorMain,
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
                            children: [
                              const Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Xin chào $fullname',
                                style: const TextStyle(
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Chưa có thông tin công ty',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 15),
                                // CustomButton(
                                //     onTap: () {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 InfoScreen(user: widget.user)),
                                //       );
                                //     },
                                //     text: 'Tạo thông tin công ty'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 0,
                left: 20,
                right: 0,
              ),
              child: Row(
                children: [
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
                    color: AppColors.dColorMain,
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

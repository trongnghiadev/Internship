import 'package:flutter/material.dart';
import 'package:login_2/config/const.dart';

class Category {
  String thumbnail;
  String name;
  int noOfCourses;
  Color color;
  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
    required this.color,
  });
}

List<Category> categoryList = [
  Category(
    color: Colors.blue,
    name: 'Quản lý sản phẩm',
    noOfCourses: 18,
    thumbnail: 'assets/image/box.png',
  ),
  Category(
    color: Colors.amber,
    name: 'Quản lý logbook',
    noOfCourses: 18,
    thumbnail: 'assets/image/hand_book.png',
  ),
  Category(
    color: AppColors.dColorMain,
    name: 'Quản lý mùa vụ',
    noOfCourses: 18,
    thumbnail: 'assets/image/sprout.png',
  ),
  Category(
    color: AppColors.dButoonInActive,
    name: 'Quản lý QRCode',
    noOfCourses: 18,
    thumbnail: 'assets/image/qr.png',
  ),
];

class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Quản lý sản phẩm',
    noOfCourses: 18,
    thumbnail: 'assets/icons/box.png',
  ),
  Category(
    name: 'Quản lý logbook',
    noOfCourses: 18,
    thumbnail: 'assets/icons/hand_book.png',
  ),
  Category(
    name: 'Quản lý mùa vụ',
    noOfCourses: 18,
    thumbnail: 'assets/icons/sprout.png',
  ),
  Category(
    name: 'Quản lý QRCode',
    noOfCourses: 18,
    thumbnail: 'assets/icons/qr.png',
  ),
];

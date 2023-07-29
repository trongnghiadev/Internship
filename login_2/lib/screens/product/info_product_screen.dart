import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_2/data/add_product.dart';
import 'package:login_2/models/product.model.dart';
import 'package:login_2/screens/main_screen.dart';
import 'package:login_2/store/storecontroller.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';

class InfoProductScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  InfoProductScreen({Key? key, this.product}) : super(key: key);

  final ProductModel? product;

  @override
  State<InfoProductScreen> createState() => _InfoProductScreenState();
}

class _InfoProductScreenState extends State<InfoProductScreen> {
  File? image;
  final _textIsRequired = 'Thông tin này là bắt buộc';

  final _formKey = GlobalKey<FormState>();
  final nameProductController = TextEditingController();
  final keyProductController = TextEditingController();
  final descriptionProductController = TextEditingController();
  final contentProductController = TextEditingController();
  final productionUnitCodeController = TextEditingController();
  final acreageProductController = TextEditingController();
  final rawMaterialAreaProductController = TextEditingController();
  final photosController = TextEditingController();
  final recipeProductController = TextEditingController();
  final recipePhotosProductController = TextEditingController();
  final farmingPhotosController = TextEditingController();
  final videoProductController = TextEditingController();
  final certificationController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Đặt giá trị ban đầu cho các TextFormField từ widget.company
    //Đã fix ở đây
    // ignore: unnecessary_null_comparison
    if (widget.product == null) return;

    nameProductController.text = widget.product!.name!;
    keyProductController.text = widget.product!.productKey!;
    descriptionProductController.text = widget.product!.description!;
    contentProductController.text = widget.product!.content!;
    productionUnitCodeController.text = widget.product!.productionUnitCode!;
    acreageProductController.text =
        widget.product!.acreage!.toString(); // kiểu double nên xài toString
    rawMaterialAreaProductController.text = widget.product!.rawMaterialArea!;
    photosController.text = widget.product!.photos!;
    recipeProductController.text = widget.product!.recipe!;
    recipePhotosProductController.text = widget.product!.recipePhotos!;
    farmingPhotosController.text = widget.product!.farmingPhotos!;
    videoProductController.text = widget.product!.video!;
    certificationController.text = widget.product!.certification!;
  }

//Thêm hình ảnh
  Future pickImage(ImageSource source) async {
    try {
      XFile? image = await picker.pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('that bai : $e');
    }
  }

  void handleAddProduct(BuildContext context) {
    final name = nameProductController.text;
    final key = keyProductController.text;
    final description = descriptionProductController.text;
    final content = contentProductController.text;
    final productionUnitCode = descriptionProductController.text;
    final acreage = acreageProductController.text;
    final rawMaterialArea = rawMaterialAreaProductController.text;
    final photos = photosController.text;
    final recipe = recipeProductController.text;
    final recipePhotos = recipePhotosProductController.text;
    final farmingPhotos = farmingPhotosController.text;
    final video = videoProductController.text;
    final certification = certificationController.text;

    AddProduct()
        .fetchData(
          //Nếu đối tượng trước 2 dấu ? null, thì xài đối tượng đăng sau
          widget.storeController.storeCompany.value.id ?? 0,
          key,
          name,
          description,
          content,
          productionUnitCode,
          double.parse(acreage),
          rawMaterialArea,
          photos,
          recipe,
          recipePhotos,
          farmingPhotos,
          video,
          certification,
        )
        .then((value) => Get.to(() => MainScreen()));
  }

  void handleUpdateProduct(BuildContext context) {
    final name = nameProductController.text;
    final key = keyProductController.text;
    final description = descriptionProductController.text;
    final content = contentProductController.text;
    final productionUnitCode = descriptionProductController.text;
    final acreage = acreageProductController.text;
    final rawMaterialArea = rawMaterialAreaProductController.text;
    final photos = photosController.text;
    final recipe = recipeProductController.text;
    final recipePhotos = recipePhotosProductController.text;
    final farmingPhotos = farmingPhotosController.text;
    final video = videoProductController.text;
    final certification = certificationController.text;

    AddProduct()
        .fetchData(
          //Nếu đối tượng trước 2 dấu ? null, thì xài đối tượng đăng sau
          widget.storeController.storeCompany.value.id ?? 0,
          key,
          name,
          description,
          content,
          productionUnitCode,
          double.parse(acreage),
          rawMaterialArea,
          photos,
          recipe,
          recipePhotos,
          farmingPhotos,
          video,
          certification,
        )
        .then((value) => Get.to(() => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Center(
                    child: Column(children: [
      Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        'Quản lý sản phẩm',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 50,
      ),
      Form(
          key: _formKey,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Tên sản phẩm',
                    // prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return _textIsRequired;
                    }
                    return null;
                  },
                  controller: nameProductController),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Mã sản phẩm',
                    // prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  controller: keyProductController),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Mô tả sản phẩm',
                  // prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: descriptionProductController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nội dung chi tiết sản phẩm',
                  // prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: contentProductController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Diện tích',
                  // prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: acreageProductController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => pickImage(ImageSource.gallery),
              child: Column(children: [
                image != null
                    ? Image.file(
                        image!,
                        height: 110,
                        width: 110,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 204, 201, 201),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 60,
                        width: 360,
                        child: const Center(child: Text('Thêm hình ảnh')),
                      ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => pickImage(ImageSource.gallery),
                  child: Column(
                    children: [
                      image != null
                          ? Image.file(
                              image!,
                              height: 110,
                              width: 110,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 204, 201, 201),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              height: 60,
                              width: 360,
                              child: const Center(child: Text('Thêm video')),
                            ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () => pickImage(ImageSource.gallery),
                        child: Column(
                          children: [
                            image != null
                                ? Image.file(
                                    image!,
                                    height: 110,
                                    width: 110,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 204, 201, 201),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    height: 60,
                                    width: 360,
                                    child: const Center(
                                        child: Text('Thêm QRcode')),
                                  ),
                            const SizedBox(height: 20),
                            //Nút botton
                            CustomButton(
                                onTap: () {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    if (widget.product == null) {
                                      handleAddProduct(context);
                                    } else {
                                      //Todo : handleUpdateProduct
                                    }
                                  }
                                },
                                //Coi kĩ áp dụng nhiều
                                text: widget.product != null
                                    ? 'Thay đổi'
                                    : 'Thêm')
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ]))
    ])))));
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_2/data/seasons/add_seasons.dart';
import 'package:login_2/models/seasons_model.dart';
import 'package:login_2/screens/seasons/seasons_list_screen.dart';
import 'package:login_2/store/storecontroller.dart';

import '../../data/seasons/get_seasons_product_list.dart';
import '../../widgets/buttons/button_bottom.dart';

class InfoSeasonProductScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  InfoSeasonProductScreen({Key? key, this.season, required this.productId})
      : super(key: key);

  final SeasonsModel? season;
  final int productId;

  @override
  State<InfoSeasonProductScreen> createState() =>
      _InfoSeasonProductScreenState();
}

class _InfoSeasonProductScreenState extends State<InfoSeasonProductScreen> {
  File? image;
  final _textIsRequired = 'Thông tin này là bắt buộc';

  final _formKey = GlobalKey<FormState>();
  final nameSeasonController = TextEditingController();
  final memberIdController = TextEditingController();
  final logBookController = TextEditingController();
  final harvestController = TextEditingController();
  final packController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Đặt giá trị ban đầu cho các TextFormField từ widget.company
    //Đã fix ở đây
    // ignore: unnecessary_null_comparison
    if (widget.season == null) return;

    nameSeasonController.text = widget.season!.name.toString();
    memberIdController.text = widget.season!.memberId.toString();

    logBookController.text = jsonEncode(widget.season!.logBook.toString());
    harvestController.text =
        widget.season!.harvest.toString(); // kiểu int nên xài toString
    packController.text = widget.season!.pack.toString();
  }

//Thêm hình ảnh
//   Future pickImage(ImageSource source) async {
//     try {
//       XFile? image = await picker.pickImage(source: source);
//       if (image == null) return;
//
//       final imageTemporary = File(image.path);
//       setState(() => this.image = imageTemporary);
//     } on PlatformException catch (e) {
//       print('that bai : $e');
//     }
//   }

  void handleAddProduct(BuildContext context) {
    final name = nameSeasonController.text;
    final memberId = memberIdController.text;
    final logBook = logBookController.text;
    final harvest = harvestController.text;
    final pack = packController.text;

    AddSeasons()
        .fetchData(
      //Nếu đối tượng trước 2 dấu ? null, thì xài đối tượng đăng sau
      name: name,
      memberId: int.parse(memberId),
      productId: widget.productId,
      pack: pack,
      harvest: harvest,
      logbook: logBook,
    )
        .then((value) {
      setState(() {
        widget.storeController.updateLoading(true);
      });
      GetSeasonsList().fetchData(widget.productId).then((value) {
        setState(() {
          widget.storeController.updateSeasonsModel(value);

          widget.storeController.updateLoading(false);
        });
      }).then((value) => Get.to(() => SeasonsListScreen()));
    });
  }

  //
  // void handleUpdateProduct(BuildContext context) {
  //   final name = nameSeasonController.text;
  //   final key = memberIdController.text;
  //   final content = logBookController.text;
  //   final acreage = harvestController.text;
  //   final rawMaterialArea = packController.text;
  //
  //   AddProduct()
  //       .fetchData(
  //         //Nếu đối tượng trước 2 dấu ? null, thì xài đối tượng đăng sau
  //         widget.storeController.storeCompany.value.id ?? 0,
  //         key,
  //         name,
  //         description,
  //         content,
  //         productionUnitCode,
  //         double.parse(acreage),
  //         rawMaterialArea,
  //         photos,
  //         recipe,
  //         recipePhotos,
  //         farmingPhotos,
  //         video,
  //         certification,
  //       )
  //       .then((value) => Get.to(() => MainScreen()));
  // }

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
        'Quản lý mùa vụ',
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
                    hintText: 'Tên vụ',
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
                  controller: nameSeasonController),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Mã nhân viên',
                    // prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  controller: memberIdController),
            ),
            const SizedBox(
              height: 20,
            ),
            // TODO: bỏ cái này chuyển sang dạng UI khac dể tương tác hơn!!!
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nhật kí canh tác',
                  // prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: logBookController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // TODO: chuyển dạng textfỏm field sang thành dạng date picker nhe!!!
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Thời gian thu hoạch',
                  // prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: harvestController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // TODO: chuyển dạng textfỏm field sang thành dạng date picker nhe!!!
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Thời gian đóng gói',
                  // prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: packController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onTap: () {
                  if (_formKey.currentState?.validate() == true) {
                    if (widget.season == null) {
                      handleAddProduct(context);
                    } else {
                      //Todo : handleUpdateProduct
                    }
                  }
                },
                //Coi kĩ áp dụng nhiều
                text: widget.season != null ? 'Thay đổi' : 'Thêm')
          ]))
    ])))));
  }
}

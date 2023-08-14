import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login_2/data/member/get_list_by_company_id.dart';
import 'package:login_2/data/seasons/add_seasons.dart';
import 'package:login_2/models/member_model.dart';
import 'package:login_2/models/seasons_model.dart';
import 'package:login_2/store/storecontroller.dart';

import '../../data/seasons/get_seasons_product_list.dart';
import '../../widgets/buttons/button_bottom.dart';
import '../../widgets/loading_placeholder.dart';
import '../../widgets/toast_message.dart';

class InfoSeasonProductScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();

  InfoSeasonProductScreen({
    Key? key,
    this.season,
    required this.productId,
  }) : super(key: key);

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

  List<Member> members = [];

  int harvestValue = 0;
  int packValue = 0;
  late FToast toast;
  bool isLoading = false;

  @override
  void initState() {
    toast = FToast();
    toast.init(context);
    super.initState();
    // Đặt giá trị ban đầu cho các TextFormField từ widget.company
    //Đã fix ở đây
    // ignore: unnecessary_null_comparison
    GetMemberListByCompanyId()
        .fetchData(widget.storeController.storeCompany.value.id ?? -1)
        .then((value) => setState(() {
              members = value;
            }));

    if (widget.season == null) return;

    nameSeasonController.text = widget.season!.name.toString();
    memberIdController.text = widget.season!.memberId.toString();

    logBookController.text = jsonEncode(widget.season!.logBook.toString());
    harvestController.text = widget.season?.harvest != null &&
            widget.season?.harvest != 0
        ? DateFormat.yMMMMd('vi').format(
            DateTime.fromMillisecondsSinceEpoch(widget.season?.harvest ?? 0))
        : ''; // kiểu int nên xài toString
    packController.text =
        widget.season?.pack != null && widget.season?.pack != 0
            ? DateFormat.yMMMMd('vi').format(
                DateTime.fromMillisecondsSinceEpoch(widget.season?.pack ?? 0))
            : '';
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
    final harvest = harvestValue;
    final pack = packValue;

    setState(() {
      isLoading = true;
    });

    AddSeasons()
        .fetchData(
      //Nếu đối tượng trước 2 dấu ? null, thì xài đối tượng đăng sau
      name: name,
      memberId: int.parse(memberId),
      productId: widget.productId,
      pack: pack,
      harvest: harvest,
      logbook: '[]',
    )
        .then((value) {
      setState(() {
        widget.storeController.updateLoading(true);
      });
    }).then((value) {
      GetSeasonsList().fetchData(widget.productId).then((value) {
        setState(() {
          widget.storeController.updateSeasonsModel(value);
          widget.storeController.updateLoading(false);
          isLoading = false;
        });
        toast.showToast(
          child: ToastMessage(
            message: 'Thêm mùa vụ thành công',
            icon: Icons.check_circle_sharp,
            // Red X icon
            backgroundColor: Colors.lightGreen[800],
            // Light red background
            textColor: Colors.white, // Red text color
          ),
        );

        Get.back();
      });
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
    Future<void> selectHarvestDate() async {
      DateTime? value = await showRoundedDatePicker(
          context: context,
          initialDate: DateTime.now(),
          borderRadius: 8,
          theme: Theme.of(context),
          height: MediaQuery.of(context).size.height * 0.45);
      if (value != null) {
        harvestValue = value.millisecondsSinceEpoch;
        harvestController.text = DateFormat.yMMMMd('vi').format(value);
      } else {
        harvestController.text = '';
      }
    }

    Future<void> selectPackDate() async {
      DateTime? value = await showRoundedDatePicker(
          context: context,
          initialDate: DateTime.now(),
          borderRadius: 8,
          theme: Theme.of(context),
          height: MediaQuery.of(context).size.height * 0.45);
      if (value != null) {
        packController.text = DateFormat.yMMMMd('vi').format(value);
      } else {
        packController.text = '';
      }
    }

    return SafeArea(
        child: Stack(children: [
      Scaffold(
          body: SingleChildScrollView(
              child: Center(
                  child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () {
                Get.back();
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
            child: Column(
                children: [
              TextFormField(
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
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                    hintText: 'Nhân viên',
                    // prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  validator: (value) {
                    if (value == null) {
                      return _textIsRequired;
                    }
                    return null;
                  },
                  value: int.tryParse(memberIdController.text ?? ''),
                  items: members.isNotEmpty
                      ? members
                          .map((e) => DropdownMenuItem<int>(
                                value: e.id ?? -1,
                                child: Text(e.name ?? ''),
                              ))
                          .toList()
                      : null,
                  onChanged: (value) {
                    setState(() {
                      memberIdController.text = value.toString();
                    });
                  }),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 24),
              //   child: TextFormField(
              //       decoration: const InputDecoration(
              //         hintText: 'Mã nhân viên',
              //         // prefixIcon: Icon(Icons.phone),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //         ),
              //       ),
              //       controller: memberIdController),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // TODO: bỏ cái này chuyển sang dạng UI khac dể tương tác hơn!!!
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: 24),
              //   child: TextFormField(
              //     decoration: const InputDecoration(
              //       hintText: 'Nhật kí canh tác',
              //       // prefixIcon: Icon(Icons.map),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(
              //             Radius.circular(10)),
              //       ),
              //     ),
              //     controller: logBookController,
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                readOnly: true,
                onTap: () => selectHarvestDate(),
                decoration: const InputDecoration(
                  hintText: 'Thời gian thu hoạch',
                  // prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: harvestController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                readOnly: true,
                onTap: () => selectPackDate(),
                decoration: const InputDecoration(
                  hintText: 'Thời gian đóng gói',
                  // prefixIcon: Icon(Icons.map),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                controller: packController,
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
            ]
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: e,
                        ))
                    .toList()))
      ])))),
      LoadingPlaceHolder(isLoading)
    ]));
  }
}

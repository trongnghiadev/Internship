import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_2/config/api.dart';
import 'package:login_2/config/const.dart';
import 'package:login_2/models/company_model.dart';
import 'package:login_2/store/storecontroller.dart';
import 'package:login_2/utils/connectivity_mixin.dart';
import 'package:login_2/utils/name_value_input_regex.dart';
import 'package:login_2/utils/phonenumber_regex.dart';
import 'package:login_2/utils/website_regex.dart';
import 'package:login_2/widgets/buttons/button_bottom.dart';

import '../../data/company/add_company.dart';
import '../../data/image/add_image_data.dart';
import '../../widgets/toast_message.dart';

class InfoScreen extends StatefulWidget {
  final storeController = Get.find<StoreController>();
  final CompanyModel company; // Thêm tham số company

  InfoScreen({Key? key, required this.company}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  File? image;
  final _textIsRequired = 'Thông tin này là bắt buộc';
  final _textNameValueFormat =
      'Vui lòng nhập từ 2 đến 60 ký tự và không có ký tự đặt biệt';
  final _textPhoneNumberFormat = 'Số điện thoại không hợp lệ';
  final _textWebsiteFormat = 'Website không hợp lệ';

  final _formKey = GlobalKey<FormState>();
  final userManageController = TextEditingController();
  final nameCompanyController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final webController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  late FToast toast;

  // final GetCompanyByUserId _companyByUserId = GetCompanyByUserId();
  String? imageUrl;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    toast = FToast();
    toast.init(context);
    // Đặt giá trị ban đầu cho các TextFormField từ widget.company
    //Đã fix ở đây
    // ignore: unnecessary_null_comparison
    if (widget.company != null) {
      nameCompanyController.text = widget.company.name ?? '';
      phoneController.text = widget.company.phone ?? '';
      addressController.text = widget.company.address ?? '';
      webController.text = widget.company.website ?? '';
      imageUrl = '${Api().convertApi(Api.apiGetImage)}/${widget.company.logo}';
    }
  }

  Future<void> uploadImage() async {
    if (image == null) {
      print('No image selected.');
      return;
    }

    UploadImage uploadImageApi = UploadImage();

    try {
      String? imageUrl = await uploadImageApi.upload(image!);
      if (imageUrl != null) {
        print('Image uploaded successfully. URL: $imageUrl');
        setState(() {
          widget.company.logo = image!.path.split('/').last;
          this.imageUrl =
              '${Api().convertApi(Api.apiGetImage)}/${image!.path.split('/').last}';
        });
      } else {
        toast.showToast(
          child: const ToastMessage(message: 'Đã xảy ra lỗi khi thêm ảnh'),
          toastDuration: const Duration(seconds: 5),
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

//Thêm hình ảnh, hiện thông báo chỉ nhận hình dưới 10MB
  Future pickImage(ImageSource source) async {
    try {
      XFile? pickedImage = await picker.pickImage(source: source);
      if ((await pickedImage?.length())! > 10000000) {
        toast.showToast(
          child: const ToastMessage(
            message: 'Chỉ nhận file từ dưới 10MB',
            // Red X icon
            backgroundColor: AppColors.dButoonInActive,
            // Light red background
            textColor: Colors.white,
          ),
          gravity: ToastGravity.BOTTOM,
        );
        return;
      }

      if (pickedImage == null) return;

      final imageFile = File(pickedImage.path);
      setState(() => image = imageFile);

      // Call the uploadImage function here to upload the selected image
      await uploadImage();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void handleSubmit(BuildContext context) {
    final nameCompany = nameCompanyController.text;
    final phone = phoneController.text;
    final address = addressController.text;
    final website = webController.text;

    AddCompany()
        .fetchData(
            //Nếu đối tượng trước 2 dấu ? null, thì xài đối tượng đăng sau
            widget.storeController.storeUser.value.id ?? 0,
            nameCompany,
            phone,
            address,
            image?.path.split('/').last ?? '',
            website)
        .then((value) {
      if (value == null) return;
      widget.storeController.updateCompany(value);
    });

    // AddCompany()
    //     .fetchData(widget.storeController.storeUser.value.id ?? 0, nameCompany,
    //         phone, address, image!.path.split('/').last, website)
    //     .then((value) {
    //   if (value is CompanyModel) {
    //     widget.storeController.updateCompany(value as CompanyModel);
    //   } else {
    //     print('Lỗi: fetchData không trả về một đối tượng CompanyModel.');
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityWrapper(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
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
                    'Thông tin công ty',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => pickImage(ImageSource.gallery),
                    child: Center(
                      child: Column(
                        children: [
                          widget.company.logo != null &&
                                  widget.company.logo != ''
                              ? Image.network(
                                  imageUrl!,
                                  height: 110,
                                  width: 110,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  decoration: const BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 156, 155, 153)),
                                  height: 110,
                                  width: 110,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Nhấn để thêm logo',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Tên công ty',
                                prefixIcon: Icon(Icons.location_city),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                print('Value: $value');
                                if (value == null || value.isEmpty) {
                                  print('Returning required error message.');
                                  return _textIsRequired;
                                }
                                if (!NameValueInputRegex.nameValuePattern
                                    .hasMatch(value)) {
                                  print(
                                      'Returning invalid format error message.');
                                  return _textNameValueFormat;
                                }
                                return null;
                              },
                              controller: nameCompanyController),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: 'Số điện thoại',
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return _textIsRequired;
                                }
                                if (!PhoneRegex.phonePattern.hasMatch(value)) {
                                  return _textPhoneNumberFormat;
                                }
                                return null;
                              },
                              controller: phoneController),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Địa chỉ',
                              prefixIcon: Icon(Icons.map),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            controller: addressController,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Website',
                              prefixIcon: Icon(Icons.web_asset),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return _textIsRequired;
                              }
                              if (!WebsiteRegex.websitePattern
                                  .hasMatch(value)) {
                                return _textWebsiteFormat;
                              }
                              return null;
                            },
                            controller: webController,
                          ),
                        ),
                        const SizedBox(height: 40),
                        //Nút botton
                        CustomButton(
                            onTap: () {
                              if (_formKey.currentState?.validate() == true) {
                                handleSubmit(context);
                                // Get.to(() => MainScreenState())!
                                //     .then((value) => null);
                                toast.showToast(
                                  child: ToastMessage(
                                    message: 'Tạo công ty thành công',
                                    icon: Icons.check_circle_sharp,
                                    // Red X icon
                                    backgroundColor: Colors.lightGreen[800],
                                    // Light red background
                                    textColor: Colors.white, // Red text color
                                  ),
                                );
                              }
                            },
                            text: 'Thay đổi')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//gắn store này vào trong app
import 'package:get/get.dart';
import 'package:login_2/store/storecontroller.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController());
  }
}

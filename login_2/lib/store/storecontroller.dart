import 'package:get/get.dart';
import '../models/userModel.dart';

class StoreController extends GetxController {
  final Rx<User> storeUser = User().obs;

  void updateUser(User user) {
    storeUser(user);
  }
}

import 'package:get/get.dart';
import 'package:login_2/models/company_model.dart';
import '../models/user_model.dart';

class StoreController extends GetxController {
  final Rx<User> storeUser = User().obs;
  final Rx<CompanyModel> storeCompany = CompanyModel().obs;

  void updateUser(User user) {
    storeUser(user);
  }

  void updateCompany(CompanyModel company) {
    storeCompany(company);
  }
}

import 'package:get/get.dart';
import 'package:login_2/models/company_model.dart';
import 'package:login_2/models/seasons_model.dart';

import '../models/product_model.dart';
import '../models/user_model.dart';

class StoreController extends GetxController {
  final Rx<User> storeUser = User().obs;
  final Rx<CompanyModel> storeCompany = CompanyModel().obs;
  final RxList<SeasonsModel> storeSeasonsList = <SeasonsModel>[].obs;
  final RxBool storeLoading = false.obs;
  final RxList<ProductModel> storeProductList = <ProductModel>[].obs;

  void updateUser(User user) {
    storeUser(user);
  }

  void updateCompany(CompanyModel company) {
    storeCompany(company);
  }

  void updateSeasonsModel(List<SeasonsModel> seasonsModels) {
    storeSeasonsList(seasonsModels);
  }

  void updateProductModel(List<ProductModel> productModels) {
    storeProductList(productModels);
  }

  void updateLoading(bool isLoadingState) {
    storeLoading(isLoadingState);
  }
}

class Api {
  String urlServer = 'https://stg.utrace.net';
  static const String apiCheckExistEmail = '/users';
  static const String apiCheckOtp = '/users/checkOtp';
  static const String apiLogin = '/users/login';
  static const String apiRegister = '/users/register';
  static const String apiAddCompany = '/company/addCompany';
  static const String apiSetNewPass = '/users/setNewPass';
  static const String apiResendOtp = '/users/changeOtp';
  static const String apiGetCompanyById = '/company';
  static const String apiGetListByCompanyId = '/members/getListByCompanyId';
  static const String apiAddMember = '/members/addMember';
  static const String apiUpdateMember = '/members/updateMember';
  static const String apiAddProduct = '/products/addProduct';
  static const String apiGetListProduct = '/products/company';
  static const String apiGetLogBook = '/logbooks';
  static const String apiAddLogBooks = '/logbooks/addlogbook';
  static const String apiUpdateLogBook = '/logbooks/updateLogbook';
  static const String apiGetSeasonsList = '/seasons/products';
  static const String apiAddSeasonsList = '/seasons/addSeason';
  static const String apiUpdateSeasonsList = '/seasons/updateSeason';
  static const String apiGetImage = '/images';
  static const String apiAddImage = '/images/upload';

  String convertApi(String url) {
    return urlServer + url;
  }
}

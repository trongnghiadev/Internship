class Api {
  String urlServer = 'https://stg.utrace.net';
  static const String apiCheckExistEmail = '/users/';
  static const String apiCheckOtp = '/users/checkOtp';
  static const String apiLogin = '/user/login';
  static const String apiRegister = '/users/register';
  static const String apiAddCompany = '/companies/addCompany';
  static const String apiSetNewPass = '/users/setNewPass';
  static const String apiResendOtp = '/users/changeOtp';
  String convertApi(String url) {
    return urlServer + url;
  }
}

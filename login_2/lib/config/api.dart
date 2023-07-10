class Api {
  String urlServer = 'https://stg.utrace.net';
  static const String apiCheckEmail = '/users';
  static const String apiCheckOtp = '/users/checkOtp';
  static const String apiLogin = '/user/login';
  static const String apiAddCompany = '/companies/addCompany';
  String convertApi(String url) {
    return urlServer + url;
  }
}

class Api {
  String urlServer = 'https://stg.utrace.net';
  static const String apiCheckEmail = '/users';
  static const String apiCheckOtp = '/users/checkOtp';
  String convertApi(String url) {
    return urlServer + url;
  }
}

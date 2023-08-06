class NameValueInputRegex {
  static RegExp nameValuePattern =
      // ignore: valid_regexps
      RegExp(r'^([a-zA-Z\xC0-\uFFFF]{2,60}[ \-]*){1,5}$');
}

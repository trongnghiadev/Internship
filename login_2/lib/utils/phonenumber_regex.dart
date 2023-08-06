// class PhoneRegex {
//   static RegExp phonePattern = RegExp(
//       r'^(\\+\\d{1,2}\\s?)?1?\\-?\\.?\\s?\\(\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}$');
// }
class PhoneRegex {
  static RegExp phonePattern =
      RegExp(r'^(\+\d{1,2}\s?)?1?[-.]?\s?\d{3}[-.]?\d{3}[-.]?\d{4}$');
}

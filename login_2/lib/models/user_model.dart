import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  String? token;
  User? user;

  UserModel({this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  bool? emailVerified;
  String? fullname;
  String? phone;
  bool? status;
  int? createdAt;
  int? updatedAt;
  String? password;

  User(
      {this.id,
      this.email,
      this.emailVerified,
      this.fullname,
      this.phone,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerified = json['emailVerified'] == 'true';
    fullname = json['fullname'];
    phone = json['phone'];
    status = json['status'] == 'true';
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['emailVerified'] = emailVerified;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['password'] = password;
    return data;
  }

  static Future<User?> getUserFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? userId = prefs.getInt('user_id');
    String? userEmail = prefs.getString('user_email');
    bool? userEmailVerified = prefs.getBool('user_emailVerified');
    String? userFullname = prefs.getString('user_fullname');
    String? userPhone = prefs.getString('user_phone');

    if (userId != null &&
        userEmail != null &&
        userEmailVerified != null &&
        userFullname != null &&
        userPhone != null) {
      return User()
        ..id = userId
        ..email = userEmail
        ..emailVerified = userEmailVerified
        ..fullname = userFullname
        ..phone = userPhone;
    }

    return null; // Trả về null nếu không tìm thấy dữ liệu trong shared preferences
  }
}

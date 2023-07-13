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
}

class CompanyModel {
  int? id;
  int? userId;
  String? name;
  String? phone;
  String? address;
  String? logo;
  String? website;
  bool? status;
  int? createdAt;
  int? updatedAt;

  CompanyModel(
      {this.id,
      this.userId,
      this.name,
      this.phone,
      this.address,
      this.logo,
      this.website,
      this.status,
      this.createdAt,
      this.updatedAt});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    logo = json['logo'];
    website = json['website'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['logo'] = logo;
    data['website'] = website;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

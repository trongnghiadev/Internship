class MemberId {
  String? name;
  int? companyId;
  double? acreage;
  String? location;

  MemberId({this.name, this.companyId, this.acreage, this.location});

  // MemberId.fromCompanyModel(CompanyModel company) {
  //   name = company.name;
  //   companyId = company.id;
  //   acreage = 0; // Giá trị mặc định cho acreage, bạn có thể thay đổi theo ý muốn.
  //   location = ""; // Giá trị mặc định cho location, bạn có thể thay đổi theo ý muốn.
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['companyId'] = companyId;
    data['acreage'] = acreage;
    data['location'] = location;
    return data;
  }
}

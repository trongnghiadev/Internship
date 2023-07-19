class Member {
  String? name;
  int? companyId;
  double? acreage;
  String? location;

  Member({this.name, this.companyId, this.acreage, this.location});

  // MemberId.fromCompanyModel(CompanyModel company) {
  //   name = company.name;
  //   companyId = company.id;
  //   acreage = 0; // Giá trị mặc định cho acreage, bạn có thể thay đổi theo ý muốn.
  //   location = ""; // Giá trị mặc định cho location, bạn có thể thay đổi theo ý muốn.
  // }

  Member.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    companyId = json['companyId'];
    acreage = json['acreage'];
    location = json['location'];
  }
}

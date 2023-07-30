class ProductModel {
  int? id;

  int? companyId;
  String? productKey;
  String? name;
  String? description;
  String? content;
  String? productionUnitCode;
  double? acreage;
  String? rawMaterialArea;
  String? photos;
  String? recipe;
  String? recipePhotos;
  String? farmingPhotos;
  String? video;
  String? certification;

  ProductModel({
    this.id,
    this.productKey,
    this.name,
    this.description,
    this.content,
    this.productionUnitCode,
    this.acreage,
    this.rawMaterialArea,
    this.photos,
    this.recipe,
    this.recipePhotos,
    this.farmingPhotos,
    this.video,
    this.certification,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productKey = json['productKey'];
    name = json['name'];
    description = json['description'];
    content = json['content'];
    productionUnitCode = json['productionUnitCode'];
    acreage = json['acreage'];
    rawMaterialArea = json['rawMaterialArea'];
    photos = json['photos'];
    recipe = json['recipe'];
    recipePhotos = json['recipePhotos'];
    farmingPhotos = json['farmingPhotos'];
    video = json['video'];
    certification = json['certification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productKey'] = productKey;
    data['name'] = name;
    data['description'] = description;
    data['content'] = content;
    data['productionUnitCode'] = productionUnitCode;
    data['acreage'] = acreage;
    data['rawMaterialArea'] = rawMaterialArea;
    data['photos'] = photos;
    data['recipe'] = recipe;
    data['recipePhotos'] = recipePhotos;
    data['farmingPhotos'] = farmingPhotos;
    data['video'] = video;
    data['certification'] = certification;
    return data;
  }
}

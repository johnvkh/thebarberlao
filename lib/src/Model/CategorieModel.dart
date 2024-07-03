// ignore_for_file: file_names

class CategorieModel {
  String? categorieId;
  String? categorieNameLA;
  String? categorieNameEN;
  String? serviceType;
  String? price;
  String? urlImage;
  String? status;
  String? sort;

  CategorieModel({
    this.categorieId,
    this.categorieNameLA,
    this.categorieNameEN,
    this.serviceType,
    this.price,
    this.urlImage,
    this.status,
    this.sort,
  });

  Map<String, dynamic> getJson() {
    return {
      'categorieId': categorieId,
      'categorieNameLA': categorieNameLA,
      'categorieNameEN': categorieNameEN,
      'serviceType': serviceType,
      'price':price,
      'urlImage': urlImage,
      'status': status,
      'sort': sort,
    };
  }

  factory CategorieModel.getModelFromJson({required Map<String, dynamic> json}) {
    return CategorieModel(
      categorieId: json["categorieId"],
      categorieNameLA: json["categorieNameLA"],
      categorieNameEN: json["categorieNameEN"],
      serviceType: json["serviceType"],
      price:json["price"],
      urlImage: json["urlImage"],
      status: json["status"],
      sort: json["sort"],
    );
  }
}

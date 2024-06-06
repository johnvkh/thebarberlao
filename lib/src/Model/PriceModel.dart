class PriceModel {
  String? serviceName;
  String? price;


  PriceModel({
    this.serviceName,
    this.price,
  });

  Map<String, dynamic> getJson() {
    return {
      'serviceName': serviceName,
      'price': price,
    };
  }

  factory PriceModel.getModelFromJson({required Map<String, dynamic> json}) {
    return PriceModel(
      serviceName: json["serviceName"],
      price: json["price"],
    );
  }
}
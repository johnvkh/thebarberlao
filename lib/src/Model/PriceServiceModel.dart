// ignore_for_file: file_names

class PriceServiceModel {
  String? priceServiceId;
  String? priceServiceNameLA;
  String? priceServiceNameEN;
  String? priceLA;
  String? priceEN;


  PriceServiceModel({
    this.priceServiceId,
    this.priceServiceNameLA,
    this.priceServiceNameEN,
    this.priceLA,
    this.priceEN,
  });

  Map<String, dynamic> getJson() {
    return {
      'priceServiceId': priceServiceId,
      'priceServiceNameLA': priceServiceNameLA,
      'priceServiceNameEN': priceServiceNameEN,
      'priceLA': priceLA,
      'priceEN': priceEN,
    };
  }

  factory PriceServiceModel.getModelFromJson({required Map<String, dynamic> json}) {
    return PriceServiceModel(
      priceServiceId: json["priceServiceId"],
      priceServiceNameLA: json["priceServiceNameLA"],
      priceServiceNameEN: json["priceServiceNameEN"],
      priceLA: json["priceLA"],
      priceEN: json["priceEN"],
    );
  }
}
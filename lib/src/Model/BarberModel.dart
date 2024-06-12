class BarberModel{
  String? barberID;
  String? barberName;
  String? urlImage;
  String? branchID;


  BarberModel({
    this.barberID,
    this.barberName,
    this.urlImage,
    this.branchID,
  });

  Map<String, dynamic> getJson() {
    return {
      'barberID': barberID,
      'barberName': barberName,
      'urlImage': urlImage,
      'branchID': branchID,
    };
  }

  factory BarberModel.getModelFromJson({required Map<String, dynamic> json}) {
    return BarberModel(
      barberID: json["barberID"],
      barberName: json["barberName"],
      urlImage: json["urlImage"],
      branchID: json["branchID"],
    );
  }
}
// ignore_for_file: file_names

class BarberModel {
  String? barberID;
  String? barberName;
  String? imageURL;
  String? branchID;
  String? position;
  String? phoneNumber;


  BarberModel({
    this.barberID,
    this.barberName,
    this.imageURL,
    this.branchID,
    this.position,
    this.phoneNumber,
  });

  Map<String, dynamic> getJson() {
    return {
      'barberID': barberID,
      'barberName': barberName,
      'imageURL': imageURL,
      'branchID': branchID,
      'position': position,
      'phoneNumber': phoneNumber,
    };
  }

  factory BarberModel.getModelFromJson({required Map<String, dynamic> json}) {
    return BarberModel(
      barberID: json["barberID"],
      barberName: json["barberName"],
      imageURL: json["imageURL"],
      branchID: json["branchID"],
      position: json["position"],
      phoneNumber: json["phoneNumber"],
    );
  }
}


// ignore_for_file: file_names

class BranchModel{
  String? branchId;
  String? branchName;
  String? googleMapURL;
  String? latitude;
  String? longitude;
  String? zoom;
  String? address;
  String? phoneNumber;

  BranchModel({
    this.branchId,
    this.branchName,
    this.googleMapURL,
    this.latitude,
    this.longitude,
    this.zoom,
    this.address,
    this.phoneNumber,
  });

  Map<String, dynamic> getJson() {
    return {
      'branchId': branchId,
      'branchName': branchName,
      'googleMapURL': googleMapURL,
      'latitude': latitude,
      'longitude': longitude,
      'zoom': zoom,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }

  factory BranchModel.getModelFromJson({required Map<String, dynamic> json}) {
    return BranchModel(
      branchId: json["branchId"],
      branchName: json["branchName"],
      googleMapURL: json["googleMapURL"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      zoom: json["zoom"],
      address: json["address"],
      phoneNumber: json["phoneNumber"],
    );
  }
}

// ignore_for_file: file_names

class BranchModel{
  String? branchId;
  String? branchNameLA;
  String? branchNameEN;
  String? googleMapURL;
  String? latitude;
  String? longitude;
  String? zoom;
  String? addressLA;
  String? addressEN;
  String? phoneNumber;

  BranchModel({
    this.branchId,
    this.branchNameLA,
    this.branchNameEN,
    this.googleMapURL,
    this.latitude,
    this.longitude,
    this.zoom,
    this.addressLA,
    this.addressEN,
    this.phoneNumber,
  });

  Map<String, dynamic> getJson() {
    return {
      'branchId': branchId,
      'branchNameLA': branchNameLA,
      'branchNameEN': branchNameEN,
      'googleMapURL': googleMapURL,
      'latitude': latitude,
      'longitude': longitude,
      'zoom': zoom,
      'addressLA': addressLA,
      'addressEN': addressEN,
      'phoneNumber': phoneNumber,
    };
  }

  factory BranchModel.getModelFromJson({required Map<String, dynamic> json}) {
    return BranchModel(
      branchId: json["branchId"],
      branchNameLA: json["branchNameLA"],
      branchNameEN: json["branchNameEN"],
      googleMapURL: json["googleMapURL"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      zoom: json["zoom"],
      addressLA: json["addressLA"],
      addressEN: json["addressEN"],
      phoneNumber: json["phoneNumber"],
    );
  }
}
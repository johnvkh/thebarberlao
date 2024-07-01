class ImageServiceModel{
  String? imageId;
  String? imageUrl;
  String? imageName;
  String? imageCode;
  String? categorieName;

  ImageServiceModel({
    this.imageId,
    this.imageUrl,
    this.imageName,
    this.imageCode,
    this.categorieName,

  });

  Map<String, dynamic> getJson() {
    return {
      'imageId': imageId,
      'imageUrl': imageUrl,
      'imageName': imageName,
      'imageCode': imageCode,
      'categorieName': categorieName,
    };
  }

  factory ImageServiceModel.getModelFromJson({required Map<String, dynamic> json}) {
    return ImageServiceModel(
      imageId: json["imageId"],
      imageUrl: json["imageUrl"],
      imageName: json["imageName"],
      imageCode: json["imageCode"],
      categorieName: json["categorieName"],
    );
  }
}
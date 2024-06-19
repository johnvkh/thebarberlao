
// ignore_for_file: file_names

class SliderModel{
  String? sliderId;
  String? sliderURL;
  String? sort;

  SliderModel({
    this.sliderId,
    this.sliderURL,
    this.sort,
  });

  Map<String, dynamic> getJson() {
    return {
      'sliderId': sliderId,
      'sliderURL': sliderURL,
      'sort': sort,
    };
  }

  factory SliderModel.getModelFromJson({required Map<String, dynamic> json}) {
    return SliderModel(
      sliderId: json["sliderId"],
      sliderURL: json["sliderURL"],
      sort: json["sort"],
    );
  }
}
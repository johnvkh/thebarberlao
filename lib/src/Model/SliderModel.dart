// ignore_for_file: file_names

class SliderModel {
  final String? sliderId;
  final String? sliderURL;
  final String? sort;

  // ✅ ເພີ່ມ const — ເພື່ອໃຫ້ BannerSlider ໃຊ້ static const list ໄດ້
  const SliderModel({
    this.sliderId,
    this.sliderURL,
    this.sort,
  });

  Map<String, dynamic> getJson() {
    return {
      'sliderId': sliderId,
      'sliderURL': sliderURL,
      'sort':      sort,
    };
  }

  factory SliderModel.getModelFromJson({required Map<String, dynamic> json}) {
    return SliderModel(
      sliderId: json["sliderId"],
      sliderURL: json["sliderURL"],
      sort:      json["sort"],
    );
  }
}
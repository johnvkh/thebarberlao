// ignore_for_file: file_names

class LanguageModel {
  int? id;
  String? name;
  String? languageCode;
  String? image;

  LanguageModel(this.id, this.name, this.languageCode,this.image);

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel(1, "ພາສາລາວ", "lo","assets/images/laos.png"),
      LanguageModel(2, "English", "en","assets/images/english.png"),
    ];
  }
}

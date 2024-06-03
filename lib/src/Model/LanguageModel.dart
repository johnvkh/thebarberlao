// ignore_for_file: file_names

class Language {
  int? id;
  String? name;
  String? languageCode;

  Language(this.id, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "ພາສາລາວ", "lo"),
      Language(2, "English", "en"),
    ];
  }
}

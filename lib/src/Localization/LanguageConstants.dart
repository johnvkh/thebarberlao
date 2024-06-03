// ignore_for_file: file_names, constant_identifier_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppLocalization.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String LAOS = 'lo';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(LAGUAGE_CODE) ?? "lo";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, 'US');
    case LAOS:
      return const Locale(LAOS, "LA");
    default:
      return const Locale(LAOS, 'LA');
  }
}

String? getTranslated(BuildContext context, String key) {
  return AppLocalization.of(context)?.translate(key);
}

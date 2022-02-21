import 'package:flutter/material.dart';
import 'package:news_paper/dictionary/data/en.dart';
import 'package:news_paper/dictionary/data/he.dart';
import 'package:news_paper/dictionary/data/ru.dart';
import 'package:news_paper/dictionary/models/supported_language.dart';
// import 'package:purple_team_empty_fridge/dictionary/data/en.dart';
// import 'package:purple_team_empty_fridge/dictionary/data/he.dart';
// import 'package:purple_team_empty_fridge/dictionary/data/ru.dart';
// import 'package:purple_team_empty_fridge/dictionary/models/supported_language.dart';

class SupportedLocales {
  List<SupportedLanguage>? _supportedLocales;

  SupportedLocales._() {
    _supportedLocales = <SupportedLanguage>[
      SupportedLanguage(
        languageCode: 'en',
        language: en,
      )..choose(),
      SupportedLanguage(
        languageCode: 'ru',
        language: ru,
      ),
      SupportedLanguage(
        languageCode: 'he',
        language: he,
      ),
    ];
  }

  static SupportedLocales instance = SupportedLocales._();

  void changeLocale(String languageCode) {
    _supportedLocales!.firstWhere((SupportedLanguage supLang) => supLang.isSelected).discard();
    _supportedLocales!.firstWhere((SupportedLanguage supLang) => supLang.languageCode == languageCode).choose();
  }

  List<Locale>? get getSupportedLocales {
    return _supportedLocales!.map((SupportedLanguage supLang) => supLang.getLocale).toList();
  }

  String get getCurrentLocale {
    return _supportedLocales!.firstWhere((SupportedLanguage supLang) => supLang.isSelected).languageCode;
  }

  SupportedLanguage getSupportedLanguage(Locale locale) {
    return _supportedLocales!.firstWhere((SupportedLanguage supLang) => supLang.languageCode == locale.languageCode);
  }
}

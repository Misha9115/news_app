// import 'package:flutter/material.dart';
//
// import 'flutter_delegate.dart';
// import 'models/language.dart';
//
//
//
// class FlutterDictionary {
//   static const String tag = '[FlutterDictionary]';

//   FlutterDictionary._privateConstructor({this.locale});
//
//   static final FlutterDictionary _instance = FlutterDictionary._privateConstructor();
//
//   static FlutterDictionary get instance => _instance;
//
//   final Locale locale;
//   Language language;
//
//   FlutterDictionary(this.locale) {
//     if (locale != null) setNewLanguage(locale.languageCode);
//   }
//
//   void setNewLanguage(String languageCode) {
//     print('$tag => setNewLanguage() => locale => $languageCode');
//     FlutterDictionaryDelegate.changeLocaleWithLanguageCode(languageCode);
//     language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
//   }
//
//   void setNewLanguageAndSave(String languageCode) {
//     print('$tag => setNewLanguageAndSave() => locale => $languageCode');
//     language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
//   }
//
//   static const List<String> _rtlLanguages = <String>[
//     'he',
//     'ps',
//     'ur',
//     'ar',
//     'fa',
//   ];
//
//   bool get isRTL {
//     return _rtlLanguages.contains(FlutterDictionaryDelegate.getCurrentLocale);
//   }
// }
import 'package:flutter/material.dart';
import 'package:news_paper/dictionary/flutter_delegate.dart';
import 'package:news_paper/dictionary/models/language.dart';


class FlutterDictionary {
  static const String tag = '[FlutterDictionary]';

  FlutterDictionary._privateConstructor({required this.locale});

  static final FlutterDictionary _instance = FlutterDictionary._privateConstructor(locale: null);

  static FlutterDictionary get instance => _instance;

  final Locale? locale;
  Language? language;
  FlutterDictionary(this.locale);

  void setNewLanguage(String languageCode) {
  //  logger.d('$tag => setNewLanguage() => locale => $languageCode');
    FlutterDictionaryDelegate.changeLocaleWithLanguageCode(languageCode);
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  void setNewLanguageAndSave(String languageCode) {
  //  logger.d('$tag => setNewLanguageAndSave() => locale => $languageCode');
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  static const List<String> _rtlLanguages = <String>[
    'he',
    'ps',
    'ur',
    'ar',
    'fa',
  ];

  bool get isRTL {
    return _rtlLanguages.contains(FlutterDictionaryDelegate.getCurrentLocale);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/language/language_selrctor.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class SettingsPageVM {
  final bool lightTheme;
  final Locale language;
  final void Function(bool theme) changeTheme;
  final void Function(String locale) changeLanguage;

  const SettingsPageVM({
    required this.lightTheme,
    required this.changeTheme,
    required this.changeLanguage,
    required this.language,
  });

  static SettingsPageVM init(Store<AppState> store) {
    return SettingsPageVM(
      lightTheme: SettingsSelectors.getTheme(store),
      changeTheme: SettingsSelectors.changeTheme(store),
      changeLanguage: LanguageSelectors.changeLanguage(store),
      language: LanguageSelectors.getLocale(store),
    );
  }
}

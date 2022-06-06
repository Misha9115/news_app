import 'package:flutter/cupertino.dart';
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/language/language_selrctor.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class SettingsPageVM {
  final bool isLight;
  final Locale language;
  final double getFontSize;
  final void Function(bool theme) changeTheme;
  final void Function(String locale) changeLanguage;
  final void Function(double size) changeFontSize;

  const SettingsPageVM({
    required this.isLight,
    required this.changeTheme,
    required this.changeLanguage,
    required this.language,
    required this.changeFontSize,
    required this.getFontSize,
  });

  static SettingsPageVM init(Store<AppState> store) {
    return SettingsPageVM(
      isLight: SettingsSelectors.getTheme(store),
      changeTheme: SettingsSelectors.changeTheme(store),
      changeLanguage: LanguageSelectors.changeLanguage(store),
      language: LanguageSelectors.getLocale(store),
      changeFontSize: SettingsSelectors.changeFontSize(store),
      getFontSize: SettingsSelectors.getFontSize(store),
    );
  }
}

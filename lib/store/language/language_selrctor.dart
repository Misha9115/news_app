import 'dart:ui';

import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/language/language_action.dart';
import 'package:redux/redux.dart';

abstract class LanguageSelectors {
  static Locale getLocale(Store<AppState> store) {
    return store.state.languageState.language;
  }
  static void Function(String locale,) changeLanguage(Store<AppState> store) {
    return (String locale) => store.dispatch(ChangeLanguage(locale: locale));
  }
}

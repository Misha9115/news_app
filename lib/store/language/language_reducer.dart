import 'dart:ui';

import 'package:news_paper/store/language/language_action.dart';
import 'package:news_paper/store/language/language_state.dart';

LanguageState languageReducer(LanguageState state, dynamic action) {
  if (action is ChangeLanguage) {
    return _savePaginationAction(state, action);
  }

  return state;
}

LanguageState _savePaginationAction(LanguageState state, ChangeLanguage action) {
  return state.copyWith(language: Locale(action.locale));
}

import 'package:news_paper/res/app_fonts.dart';
import 'package:news_paper/store/settings/settings_actions.dart';
import 'package:news_paper/store/settings/settings_state.dart';

SettingsState settingsReducer(SettingsState state, dynamic action) {
  if (action is ChangeSettingsTheme) {
    return _changeThemeAction(state, action);
  } else if (action is ChangeFontSize) {
    return _changeFontSizeAction(state, action);
  }
  return state;
}

SettingsState _changeThemeAction(SettingsState state, ChangeSettingsTheme action) {
  return state.copyWith(lightTheme: action.lightTheme);
}

SettingsState _changeFontSizeAction(SettingsState state, ChangeFontSize action) {
  AppFonts.size = action.fontSize;
  return state.copyWith(fontSize: action.fontSize);
}

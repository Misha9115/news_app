
import 'package:news_paper/store/settings/settings_actions.dart';
import 'package:news_paper/store/settings/settings_state.dart';

SettingsState settingsReducer(SettingsState state, dynamic action) {
  if (action is ChangeSettingsTheme) {
    return _savePaginationAction(state, action);
  }

  return state;
}

SettingsState _savePaginationAction(SettingsState state, ChangeSettingsTheme action) {
  return state.copyWith(lightTheme: action.lightTheme);
}

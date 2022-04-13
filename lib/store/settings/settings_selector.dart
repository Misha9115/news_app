import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/settings/settings_actions.dart';
import 'package:redux/redux.dart';

abstract class SettingsSelectors {
  static bool getTheme(Store<AppState> store) {
    return store.state.settingsState.lightTheme;
  }

  static double getFontSize(Store<AppState> store) {
    return store.state.settingsState.fontSize;
  }

  static void Function(bool lightTheme) changeTheme(Store<AppState> store) {
    return (bool lightTheme) => store.dispatch(ChangeSettingsTheme(lightTheme: lightTheme));
  }

  static void Function(double fontSize) changeFontSize(Store<AppState> store) {
    return (double fontSize) => store.dispatch(ChangeFontSize(fontSize: fontSize));
  }
}

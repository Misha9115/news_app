import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/settings/settings_actions.dart';
import 'package:redux/redux.dart';

abstract class SettingsSelectors {
  static bool getTheme(Store<AppState> store) {
    return store.state.settingsState.lightTheme;
  }
  static void Function(bool lightTheme) changeTheme(Store<AppState> store) {
    return (bool lightTheme) => store.dispatch(ChangeSettingsTheme(lightTheme:  lightTheme));
  }
}

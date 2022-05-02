import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class MainLayoutsVM {
  final bool isLight;
  final double fontSize;

  const MainLayoutsVM({
    required this.isLight,
    required this.fontSize,
  });

  static MainLayoutsVM init(Store<AppState> store) {
    return MainLayoutsVM(
      isLight: SettingsSelectors.getTheme(store),
      fontSize: SettingsSelectors.getFontSize(store),
    );
  }
}

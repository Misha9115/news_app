
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class MainLayoutsVM {
  final bool lightTheme;
  final double fontSize;

  const MainLayoutsVM({
    required this.lightTheme,
    required this.fontSize,
  });

  static MainLayoutsVM init(Store<AppState> store) {
    return MainLayoutsVM(
      lightTheme: SettingsSelectors.getTheme(store),
      fontSize: SettingsSelectors.getFontSize(store),
    );
  }
}

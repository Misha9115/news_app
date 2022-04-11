
import 'package:news_paper/store/application/app_state.dart';
import 'package:news_paper/store/settings/settings_selector.dart';
import 'package:redux/redux.dart';

class MainLayoutsVM {
  final bool lightTheme;

  const MainLayoutsVM({
    required this.lightTheme,
  });

  static MainLayoutsVM init(Store<AppState> store) {
    return MainLayoutsVM(
      lightTheme: SettingsSelectors.getTheme(store),
    );
  }
}
